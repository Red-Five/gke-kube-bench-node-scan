#!/bin/bash

# kube-bench-node scan for GKE worker nodes
# QUICK PROOF OF CONCEPT. VERIFY IT MEETS YOUR NEEDS AND USE AT YOUR OWN RISK
# Script to be run on Google Cloud Shell configured to point to the 
# project hosting the GKE nodes
# Assumes user has needed access rights
# This script deploys a kube-bench pod on the cluster and runs a job one time
# Ref. https://github.com/aquasecurity/kube-bench

set -x

git clone --single-branch --branch=master https://github.com/aquasecurity/kube-bench.git

# Point to the Cluster to be analysed
CLUSTER= #e.g. standard-cluster-1
ZONE= 	 #e.g. us-central1-a

gcloud config set compute/zone ${ZONE}
gcloud config set container/cluster ${CLUSTER}
gcloud container clusters get-credentials ${CLUSTER}
kubectl apply -f kube-bench/job-node.yaml

echo 'sleep 60 to allow time for job to complete'
sleep 60

POD=$(kubectl get pod -l job-name=kube-bench-node -o name)
kubectl logs ${POD} > kube-bench-node-scan.log

# Cleanup
kubectl delete -f kube-bench/job-node.yaml
rm -rf kube-bench

set +x