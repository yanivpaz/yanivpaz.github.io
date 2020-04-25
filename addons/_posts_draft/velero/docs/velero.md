# Velero

## Install 

### helm chart

```
helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts
kubectl create ns velero
helm install my-velero vmware-tanzu/velero  -f values/valero-values.yaml --namespace velero
```

### CLI 
Example:

```
wget https://github.com/vmware-tanzu/velero/releases/download/v1.2.0/velero-v1.2.0-linux-amd64.tar.gz
tar -zxvf velero-v1.2.0-linux-amd64.tar.gz
sudo mv velero-v1.2.0-linux-amd64/velero /usr/local/bin/
```

follow the instructions 
```
helm get notes my-velero
```

## Links
https://github.com/vmware-tanzu/helm-charts
https://velero.io/
