#/bin/bash
  
set -o errexit
set -o nounset
set -o pipefail


# check if helm is installed in your machine
command -v helm >/dev/null 2>&1 || curl -L https://git.io/get_helm.sh | bash

install_helm() {
  # assign yourself an admin role
  kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin \
        --user=$(gcloud config get-value account) || echo 'cluster-role-binding already exists'

  # install helm tiller in the cluster
  kubectl create serviceaccount tiller --namespace kube-system || echo 'serviceaccount tiller already exits'
  kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin \
               --serviceaccount=kube-system:tiller || echo 'clusterrolebinding already exists'

  helm init --service-account=tiller
  helm repo update && sleep 20
  helm version
}

install_helm
