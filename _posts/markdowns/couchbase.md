# Couchbase deployment on windows  

## Software list 
* Couchbase 6.5.1
* couchbase-autonomous-operator 2
* WSL 1


## Links
https://blog.couchbase.com/couchbase-autonomous-operator-2-0-for-kubernetes-is-now-ga/
https://docs.couchbase.com/operator/2.0/install-kubernetes.html


## Download
download the couchbase-autonomous package after short registration from  
https://www.couchbase.com/downloads  
OR
```
# Make temp dir 
mkdir ~/cb-aok2 && cd ~/cb-aok2 
export CBVER=2.0.0
curl -LO https://packages.couchbase.com/kubernetes/${CBVER}/couchbase-autonomous-operator-kubernetes_${CBVER}-linux-x86_64.tar.gz
```

## Install 
```
tar zxvf couchbase-autonomous-operator-kubernetes_${CBVER}-linux-x86_64.tar.gz
rm -f couchbase-autonomous-operator-kubernetes_${CBVER}-linux-x86_64.tar.gz
#Generate files 
couchbase-autonomous-operator-kubernetes_${CBVER}-linux-x86_64/bin/cbopcfg -file
kubectl apply -f .
```

## Check 
```
kubectl get pod -l 'app in (couchbase-operator-admission,couchbase-operator)' 
```

