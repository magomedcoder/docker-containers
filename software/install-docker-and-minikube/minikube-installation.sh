#! /bin/bash
HOSTNAME=$(hostname)
sed -i "1s/localhost/"${HOSTNAME}"/g" /etc/hosts
sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
sudo apt install conntrack
minikube start --vm-driver=none
MINIKUBE_VERSION=$(ls .minikube/cache/linux)
mv .minikube/cache/linux/${MINIKUBE_VERSION}/kubectl /usr/local/bin/
sudo chown -R $USER $HOME/.kube $HOME/.minikube