# gke-kube-bench-node-scan
Utility Script to run the Aqua Open Source kube-bench k8s CIS scans on GKE worker node pool.

Whilst this script has no copyright, all Copyrights and Licence of Aqua kube-bench are preserved.

Ref. https://github.com/aquasecurity/kube-bench/blob/master/LICENSE

Ref. https://github.com/aquasecurity/kube-bench

This is a quick Proof of Concept. Users are responsible for ensuring it meets their needs and use it at their own risk.

Assumptions
1. Script is run on Google Cloud Shell VM, configured to point to the hosting GCP Project
2. User has needed access rights to run the script against the cluster

Usage
1. Upload the script to Cloud Shell VM
2. Modify the CONTAINER and ZONE variables to point to your cluster
3. Run the script
4. Review the output log file

The script
1. clones kube-bench
2. deploys the kube-bench job to the specified cluster
3. ouputs the job log
4. deletes the job
5. deletes the kube-bench clone directory