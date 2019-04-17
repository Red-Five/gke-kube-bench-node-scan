# gke-kube-bench-node-scan
Utility Script to run the Open Source project kube-bench CIS scans on GKE worker node pool.

Ref. https://github.com/aquasecurity/kube-bench

Usage

Edit the CLUSTER and REGION variables in https://github.com/Red-Five/gke-kube-bench-node-scan/blob/master/kube-bench-node-scan.sh to point to your cluster

Run Script on Google Cloud Shell
./kube-bench-node-scan.sh

Inspect results in
kube-bench-node-scan.log 
