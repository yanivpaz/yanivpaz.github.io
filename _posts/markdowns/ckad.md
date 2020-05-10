# Notes for CKAD preparation 
## commands 

```
alias k=kubectl
source <(kubectl completion bash)
complete -F __start_kubectl k 
```

```
export WINNAME=`cmd.exe /c "echo %USERNAME%"| tr -d '\r' `
mkdir ~/.kube ; cp /mnt/c/Users/${WINNAME}/.kube/config ~/.kube

```

## Links 
* https://github.com/cncf/curriculum  
* https://training.linuxfoundation.org/wp-content/uploads/2020/03/Important-Tips-CKA-CKAD-March-2020.pdf  
* https://github.com/bmuschko/ckad-crash-course  


