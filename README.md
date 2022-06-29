# mongodb Backup
![Helm](https://helm.sh/img/helm.svg)

This Helm chart runs a cronjob and creates backup at a regular interval in the form of `.tar.gz` and upload the `tar.gz` file to GCS bucket. The chart is designed in such a manner that the Kubernetes Cluster need not be hotsed on GKE. In case of GKE cluster, the chart provides options to utilize the GKE `workload identity` feature to map GKE service account to Kubernetes Service Account.
* [Prerequisites](mongodb-backup/README.md#prerequisites)
* [Installation](mongodb-backup/README.md#installation)
* [Introduction](mongodb-backup/README.md#introduction)
* [Parameters](mongodb-backup/README.md#parameters)
    * [Cronjob Parameters](mongodb-backup/README.md#cronjob-parameters)
    * [mongodb and GCS Parameters](mongodb-backup/README.md#mongodb-and-gcs-parameters)
    * [Workload Identity and Service account parameters](mongodb-backup/README.md#workload-identity-and-service-account-parameters)
* [Creating Workload Identity](mongodb-backup/README.md#creating-workload-identity)