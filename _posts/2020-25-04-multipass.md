# Multi pass
Multipass is simple provisoning tool from Canonical . 
The idea is very similar to old good vagrant tool , with focus of more simple and intuitive user experience .
The tool leverage cloud init to setup the vm during setup , as standard cloud instances. 


## Install multipss 
https://multipass.run/


```
sudo snap install microck8s
sudo microk8s enable helm3
sudo microk8s helm3 install my-jenkins stable/jenkins
sudo microk8s kubectl get pods --all-namespaces
```
