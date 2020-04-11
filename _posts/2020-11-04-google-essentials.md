---
layout: post
title: Google essentials 
subtitle: My first Google experience
gh-repo: daattali/beautiful-jekyll
gh-badge: [star, fork, follow]
tags: [test]
comments: true
---


# Google Cloud Essentials
## Login 
```
gcloud auth login
```

## Set region/zone
``` 
export PROJECT_ID=my-proj
export ZONE=us-central1-a
gcloud config set project my-proj
gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a
gcloud config set compute/zone  us-east1-b

```

## View configuration
```
gcloud compute project-info describe --project $PROJECT_ID
gcloud config list 
gcloud config list compute/zone
gcloud config list --all
gcloud components list
```

## VM commands
```  
gcloud compute instances create nucleus-jumphost --machine-type  f1-micro 

gcloud beta compute ssh --zone "us-central1-a" "gcelab" --project "my-project"
```

## K8s command 
```
gcloud container clusters create my-cluster
gcloud container clusters get-credentials my-cluster 
kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:2.0
kubectl expose deployment hello-app --type=LoadBalancer --port 8080
# Wait for external IP
gcloud container clusters delete my-cluster

```

## Network loadbalancer
```
cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF

gcloud compute instance-templates create nginx-template \
--machine-type=f1-micro    --metadata-from-file startup-script=startup.sh

#Create a target pool. A target pool allows a single access point 
#to all the instances in a group and 
#is necessary for load balancing in the future steps.
gcloud compute target-pools create nginx-pool

gcloud compute instance-groups managed create nginx-group \
         --base-instance-name nginx \
         --size 2 --template nginx-template --target-pool nginx-pool
gcloud compute instances list
gcloud compute firewall-rules create www-firewall --allow tcp:80
gcloud compute forwarding-rules create nginx-lb \
         --region us-central1 --ports=80 --target-pool nginx-pool
gcloud compute forwarding-rules list
```

## Http loadbal
### Overview
```
https://stackoverflow.com/questions/41541858/creating-a-http-load-balancer-in-google-cloud-platform
```


### Steps

* Create an instance template
* Create a target pool
* Create a managed instance group
* Create a firewall rule to allow traffic (80/tcp)
* Create a health check
* Create a backend service and attach the manged instance group
* Create a URL map and target HTTP proxy to route requests to your URL map
* Create a forwarding rule


### Commands 

```
gcloud compute instance-templates create nginx-template \
         --metadata-from-file startup-script=startup.sh \
         --machine-type f1-micro

gcloud compute target-pools create nginx-pool


gcloud compute http-health-checks create http-basic-check


gcloud compute instance-groups managed create nginx-group \
         --base-instance-name nginx  \
         --size 2 --template nginx-template --target-pool nginx-pool

gcloud compute instance-groups managed  set-named-ports nginx-group    \
--named-ports http:80


gcloud compute backend-services create nginx-backend   \
--protocol HTTP --http-health-checks http-basic-check --global

gcloud compute backend-services add-backend nginx-backend    \
--instance-group nginx-group     --instance-group-zone us-east1-b     --global

gcloud compute url-maps create web-map     --default-service nginx-backend

gcloud compute target-http-proxies create http-lb-proxy     --url-map web-map

gcloud compute forwarding-rules create http-content-rule         --global   \
--target-http-proxy http-lb-proxy         --ports 80

gcloud compute firewall-rules create www-firewall --allow tcp:80

gcloud compute forwarding-rules list
```


