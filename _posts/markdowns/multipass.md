## Setup 
* Install multipass  
The tool is available for Mac, Windows and Linux at [multipass site](https://multipass.run/)


* Multipass default dir
in order to change multipass data dir run the following from powershell admin 
```
Stop-Service Multipass
Set-ItemProperty -Path "HKLM:System\CurrentControlSet\Control\Session Manager\Environment" -Name MULTIPASS_STORAGE -Value "d:\multipass"
Start-Service Multipass
```

See [this link](https://github.com/canonical/multipass/pull/1789) for more information 



* Create cloud-config.yaml file:  
this file will be executed during the first boot of the instance  
```
#cloud-config
runcmd:
 - sudo snap install microk8s --classic 
 - sudo microk8s enable helm3
 - sudo microk8s helm3 repo add stable https://kubernetes-charts.storage.googleapis.com
 - sudo microk8s enable dns
 - sudo microk8s helm3 install my-jenkins --set persistence.enabled=false,master.serviceType=NodePort,master.adminPassword="admin",master.nodePort=31000 stable/jenkins
```

* Spin up the vm  
open cmd window and run the following command 
```
multipass.exe launch 20.04 -n ubuntu2004 --cloud-init cloud-config.yaml -v
```

## Accessing the VM 
* Get the IP of the VM  , in order to get the IP of Jenkins UI
```
multipass.exe info ubuntu2004
```
* Login to the instance 
```
multipass.exe shell ubuntu2004
```
* Check the pod
```
sudo microk8s kubectl get pods --all-namespaces
```
* Login to the Jenkins UI  
  - open chrome and type [ip address from multipass.exe info output]:31000  
  - use admin/admin as credantials     
## Troubleshooting  
Run the following command 
```
tail -f /var/log/cloud-init-output.log
```
