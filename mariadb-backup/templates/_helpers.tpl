{{ define "isenabled.workloadorserviceaccount" }}
{{- if and (not .Values.workloadIdentity.enabled) (not .Values.gcs_serviceaccount.enabled) }}
{{- fail "Either Workload Identity or GCP service Account secret should be enabled to access the GCS Bucket" -}}
{{- end }}
{{- end -}}

{{ define "backup.serviceaccount" }}
{{- if .workloadIdentity.enabled }}
serviceAccountName: {{ required "Kubernetes service account having workload identity is mandatory" .workloadIdentity.serviceAccountonKuberenetes }}
{{- else }}
serviceAccountName: default
{{- end }}
{{- end }}

{{- define "backup.gcp_serviceaccount" }}
{{- if .Values.gcs_serviceaccount.enabled -}}
{{- if .Values.gcs_serviceaccount.existing_secret.enabled }}
{{- with .Values.gcs_serviceaccount.existing_secret }}
- name: gcloud-key
  secret:
    secretName: {{ required "Secret Name is required containing the service account private key as json" .secretName | quote }}
    items:
      - key: {{ required "Secret Key is required containing the service account private key as json" .secretKey | quote }}
        path: serviceaccount.json
{{- end }}
{{- else }}
- name: gcloud-key
  secret:
    secretName: {{ .Chart.Name }}-serviceaccount-key
    items:
      - key: serviceaccount.json
        path: serviceaccount.json
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "backup.gcp_creds" }}
- name: GOOGLE_APPLICATION_CREDENTIALS
  value: "/gcloud-key/serviceaccount.json"
{{- end -}}

{{ define "mariadb.secretresource" }}
{{- with .Values.mariadb_existing_secret }}
{{- if .enabled }}
- name: DB_ADMIN_USER
  valueFrom:
    secretKeyRef:
      name: {{ required "mariadb admin user Secret key required" .mariadb_admin_user.secretName }}
      key: {{ required "mariadb secret Name required" .mariadb_admin_user.secretKey }}
- name: DBPASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ required "mariadb admin password secret key required" .mariadb_password.secretName }}
      key: {{ required "mariadb secret Name required" .mariadb_password.secretKey }}
{{- else }}
- name: DB_ADMIN_USER
  value: {{ default "mariadb" $.Values.mariadb_admin_user | quote }}
- name: "DBPASSWORD"
  value: {{ required "mariadb Password required" $.Values.mariadb_Password | quote }}
{{- end }}
{{- end }}
{{- end }}