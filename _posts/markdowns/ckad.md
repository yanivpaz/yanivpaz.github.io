# Notes for CKAD preparation 
## commands 

```
alias k=kubectl
source <(kubectl completion zsh)
#complete -F __start_kubectl k 
```

```
export WINNAME=`cmd.exe /c "echo %USERNAME%"| tr -d '\r' `
mkdir ~/.kube ; cp /mnt/c/Users/${WINNAME}/.kube/config ~/.kube

```

## Create resources 
```
k run  --image=nginx -o yaml --dry-run=client --limits="cpu=100m" --serviceaccount=mysa --requests="memory=100Mi"  \
--labels="mylabel=myvalue" --port=80  --expose  myservice -- /bin/sh -c  'echo mytest'
k create deployment mydep --image=nginx 
```

```
kubectl config set-context <context-of-question> --namespace=<namespace-of-question>
 kubectl delete pod nginx --grace-period=0 --force
 kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' |sort
```


## Links 
* https://github.com/cncf/curriculum  
* https://training.linuxfoundation.org/wp-content/uploads/2020/03/Important-Tips-CKA-CKAD-March-2020.pdf  
* https://github.com/bmuschko/ckad-crash-course  


