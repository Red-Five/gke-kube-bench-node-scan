#!/bin/bash
# This script is unlicenced, however it uses kube-bench which is a Third Party open source
# project covered under the Apache Licence.
# Ref. https://github.com/aquasecurity/kube-bench
# Ref. https://github.com/aquasecurity/kube-bench/blob/master/LICENSE

set -x

git clone --single-branch --branch=master https://github.com/aquasecurity/kube-bench.git

# TODO Point to the Cluster to be analysed
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
