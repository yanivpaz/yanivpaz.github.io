---
layout: post
title: Local Kubernetes 
subtitle: Goodbye vagrant - hello multipass
comments: true
---

# Multipass   
There are many ways to install local K8s cluster on local laptop , including :
* [Docker desktop with K8s](https://www.docker.com/blog/docker-windows-desktop-now-kubernetes/)
* [WSL2](https://ubuntu.com/wsl) with [K3S](https://k3s.io/) or [Kind](https://kubernetes.io/docs/setup/learning-environment/kind/)
* [Redhat CRC](https://developers.redhat.com/blog/2019/09/05/red-hat-openshift-4-on-your-laptop-introducing-red-hat-codeready-containers/)

In this blog I will review another option with the latest Ubuntu 20.04 using multipass with microck8s.

Multipass is a simple provisioning tool from Canonical.   
The Multipasstool is:
* Similar to the [vagrant](https://www.vagrantup.com/)  , but offer more simple and intuitive user experience.
* leverage cloud init to set up the vm during startup, as standard cloud instances. 
* provide similar capabilities as WSL2 on Windows 

I will demonstrate a quick Jenkins installation. 
Disclaimer: the commands I am using are for demo only.

## Setup 
* Install multipass  
The tool is available for Mac, Windows and Linux at [multipass site](https://multipass.run/)

* Create cloud-config.yaml file:  
this file will be executed during first boot of the instance  
```
``#cloud-config``

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

## Access the VM 
* Get the IP of the VM 
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
* Login to the [ip address from multipass.exe info stage]:31000 with admin/admin 
* Troubleshooting  
check the logs 
```
tail -f /var/log/cloud-init-output.log
```
