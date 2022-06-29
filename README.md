# Mariadb Backup
![Helm](https://helm.sh/img/helm.svg)

This Helm chart runs a cronjob and creates backup at a regular interval in the form of `.tar.gz` and upload the `tar.gz` file to GCS bucket. The chart is designed in such a manner that the Kubernetes Cluster need not be hotsed on GKE. In case of GKE cluster, the chart provides options to utilize the GKE `workload identity` feature to map GKE service account to Kubernetes Service Account.
* [Prerequisites](mariadb-backup/README.md#prerequisites)
* [Installation](mariadb-backup/README.md#installation)
* [Introduction](mariadb-backup/README.md#introduction)
* [Parameters](mariadb-backup/README.md#parameters)
    * [Cronjob Parameters](mariadb-backup/README.md#cronjob-parameters)
    * [mariadb and GCS Parameters](mariadb-backup/README.md#mariadb-and-gcs-parameters)
    * [Workload Identity and Service account parameters](mariadb-backup/README.md#workload-identity-and-service-account-parameters)
* [Creating Workload Identity](mariadb-backup/README.md#creating-workload-identity)