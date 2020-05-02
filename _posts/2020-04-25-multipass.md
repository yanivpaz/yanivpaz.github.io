---
layout: post
title: Local Kubernetes using multipass
subtitle: ... and how to test cloudinit locally
comments: true
---

# Multipass   
There are many ways to install local K8s cluster on local laptop , including :
* [Docker desktop with K8s](https://www.docker.com/blog/docker-windows-desktop-now-kubernetes/)
* [WSL2](https://ubuntu.com/wsl) with [K3S](https://k3s.io/) or [Kind](https://kubernetes.io/docs/setup/learning-environment/kind/)
* [Redhat CRC](https://developers.redhat.com/blog/2019/09/05/red-hat-openshift-4-on-your-laptop-introducing-red-hat-codeready-containers/)

In this blog I will review another option with the latest Ubuntu 20.04 using multipass with microck8s.

Multipass is a simple provisioning tool from Canonical.   
highlights of multipass are :
* Provide simple way to spin up VM - similar to [vagrant](https://www.vagrantup.com/)  , but more simple and intuitive to use.
* Leverage cloud init mechnism to set up the vm during startup, as standard cloud instances. 
* Provides similar capabilities as WSL2 on Windows 

I will demonstrate a quick Jenkins installation. 
Disclaimer: the commands I am using are for demo only.

[click here to continue](https://github.com/yanivpaz/yanivpaz.github.io/blob/master/_posts/markdowns/multipass.md) 
