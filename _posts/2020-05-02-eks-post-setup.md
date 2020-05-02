---
layout: post
title: EKS addons
subtitle: curated list of eks addons
tags: [eks]
comments: true
---

so you managed to install EKS cluster (control plane and worked nodes) using [your favourite method](https://github.com/yanivpaz/yanivpaz.github.io/blob/master/_posts/markdowns/eks-deployment-methods.md).   
The next phase is to deploy the relevant addons from [this list](https://github.com/yanivpaz/yanivpaz.github.io/blob/master/_posts/markdowns/eks-posts-deployment.md) .  

Hopefully AWS will provide simple method to deploy all those addons using one of the popular tools to deploy multiple helm charts ( like [helmfile](https://github.com/roboll/helmfile) ,[reckoner](https://github.com/FairwindsOps/reckoner) ,[helmsman](https://github.com/Praqma/helmsman) etc).  
I didnt like the AWS way of [helm charts deployment using cloudformation](https://github.com/aws-quickstart/quickstart-amazon-eks/blob/master/templates/amazon-eks-prometheus.template.yaml).    

