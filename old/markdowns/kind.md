# Local kind cluster

In this blog I will demonstdrate  how to leverage docker desktop to deploy kubernetes cluster using [kind](https://github.com/kubernetes-sigs/kind)
The example tested on Windows using WSL - should be similar  on other platforms


## Prerequists

* install [docker desktop](https://www.docker.com/products/docker-desktop) with default values 
* post installation 
- change memory to 4GB - default is 2GB ( resources -> advanced -> memory )  
- do not enable kubernetes feature in docker desktop

* install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) 


## Install kind
open WSL and run the following commands :
```
curl -LO "https://kind.sigs.k8s.io/dl/latest/linux-amd64.tgz"
tar zxvf ./linux-amd64.tgz
```

create basic kind.yaml file 

```
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
# 1 control plane node and 3 workers
nodes:
# the control plane node config
- role: control-plane
# the three workers
- role: worker
- role: worker
- role: worker
```


## Start the cluster
```
export DOCKER_HOST=tcp://localhost:2375
kind create cluster --config kind.yaml --name my-kind --image=kindest/node:v1.18.2 
```

Wait ...
```
Creating cluster "my-kind" ...
 ✓ Ensuring node image (kindest/node:v1.18.2) 🖼
 ✓ Preparing nodes 📦 📦 📦 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
 ✓ Joining worker nodes 🚜
Set kubectl context to "kind-my-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-my-kind
````

## Run demo app 
```
kubectl run nginx --generator=run-pod/v1 --image=nginx:latest --replicas=2  --image-pull-policy=Always
```

wait for nginx pod 
```
kubectl  get pods -o wide -w
```
