# gke-kube-bench-node-scan
Utility Script to run the Open Source project kube-bench CIS scans on GKE worker node pool.
Ref. https://github.com/aquasecurity/kube-bench

Usage

Edit the CONTAINER and ZONE variables in ./kube-bench-node-scan.sh to point to your cluster

Run Script on Google CLoud Shell
./kube-bench-node-scan.sh

Inspect results in
kube-bench-node-scan.log 
