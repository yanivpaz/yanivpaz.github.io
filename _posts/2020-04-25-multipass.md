---
layout: post
title: Local Kubernetes 
subtitle: Goodbye vagrant - hello multipass
comments: true
---

# Multi pass   
In the search of best K8s experinece on Windows there are several options :
* [Docker desktop with K8s](https://www.docker.com/blog/docker-windows-desktop-now-kubernetes/)
* [WLS2](https://ubuntu.com/wsl) with [K3s](https://k3s.io/)
* [Redhat CRC](https://developers.redhat.com/blog/2019/09/05/red-hat-openshift-4-on-your-laptop-introducing-red-hat-codeready-containers/)

In this blog I will review another option with the latest Ubuntu 20.04 with microck8s.
I will demonstrate quick Jenkins installation . 

Multipass is simple provisoning tool from Canonical .   
The Multipasstool is:
* similar to the [vagrant](https://www.vagrantup.com/)  , but offer more simple and intuitive user experience .
* leverage cloud init to setup the vm during startup , as standard cloud instances. 
* provide similar capabilities as WSL2 on Windows 

Disclaimer : the commands I am using are for demo only.

## Install multipss 
The tool is available for Mac, Windows and Linux. 

https://multipass.run/

## Create cloud-config.yaml file
```
#cloud-config

runcmd:
 - sudo snap install microk8s --classic 
 - sudo microk8s enable helm3
 - sudo microk8s helm3 repo add stable https://kubernetes-charts.storage.googleapis.com
 - sudo microk8s enable dns
 - sudo microk8s helm3 install my-jenkins --set persistence.enabled=false,master.serviceType=NodePort,master.adminPassword="admin",master.nodePort=31000 stable/jenkins
```

## Spin up the vm 
open cmd window and run the following command 
```
multipass.exe launch 20.04 -n ubuntu2004 --cloud-init cloud-config.yaml -v
```

## Login to the instance 
```
multipass.exe shell ubuntu2004
```

## Check the pod
```
sudo microk8s kubectl get pods --all-namespaces
```

## Login to the Jenkins UI
```
multipass.exe info ubuntu2004
```

Login to the <IPv4 address>:31000 with admin/admin 

## Troubleshooting 
check the logs 
```
 tail -f /var/log/cloud-init-output.log
```
