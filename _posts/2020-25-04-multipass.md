# Multi pass


sudo snap install microck8s
sudo microk8s enable helm3
sudo microk8s helm3 install my-jenkins stable/jenkins
sudo microk8s kubectl get pods --all-namespaces

