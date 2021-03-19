#!/bin/bash

# Utility script to run kube-bench on GKE
# Ref. https://github.com/aquasecurity/kube-bench
# Ref. https://github.com/aquasecurity/kube-bench/blob/master/LICENSE

# Fail fast
set -e

# Log cmds to console
set -x

# Clone kube-bench master branch locally
git clone --single-branch --branch=master https://github.com/aquasecurity/kube-bench.git

# USER TODO Point to the Cluster to be analysed
CLUSTER=#e.g. standard-cluster-1
REGION=#e.g. us-central1

gcloud container clusters get-credentials ${CLUSTER} --region=${REGION}

# Deploy kube-bench to cluster to run the GKE specific tests
kubectl apply -f kube-bench/job-gke.yaml

echo 'sleep 30 to allow time for job to complete'
sleep 30

# Identify the kube-bench pod id
POD=$(kubectl get pod -l job-name=kube-bench-node -o name)

# Download kube-bench pod logs, they contain the inspection report
kubectl logs ${POD} > kube-bench-node-scan.log

# Cleanup
kubectl delete -f kube-bench/job-gke.yaml
rm -rf kube-bench

# Unset logs cmds to console
set +x

# Unset fail fast
set +e
