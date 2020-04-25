---
layout: post
title: Goodbye vagrant 
subtitle: hello multipass
comments: true
---

# Multi pass
Multipass is simple provisoning tool from Canonical .   
The tool is 
* similar to the [vagrant](https://www.vagrantup.com/)  , but offer more simple and intuitive user experience .
* leverage cloud init to setup the vm during startup , as standard cloud instances. 
* provide similar capabilities as WSL2 on Windows 

## Install multipss 
The tool is available for mac , Windows and Linux. 

https://multipass.run/

## Create cloud-config.yaml file
```
#cloud-config

runcmd:
 - sudo snap install microck8s --classic 
 - sudo microk8s enable helm3
 - sudo microk8s helm3 install my-jenkins stable/jenkins
 - sudo microk8s kubectl get pods --all-namespaces
```

## Spin up the vm 
open cmd window and run the following command 
```
multipass.exe launch 20.04 -n ubutnu2004 --cloud-init cloud-config.yaml
```
