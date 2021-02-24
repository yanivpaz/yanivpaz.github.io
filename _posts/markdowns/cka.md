# CKA prep

## SecurityContexts
 
https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ 
```                   
sudo useradd -u 2000 container-user-0
sudo groupadd -g 3000 container-group-0

sudo mkdir -p /etc/message/
echo "Hello, World!" | sudo tee -a /etc/message/message.txt
sudo chown 2000:3000 /etc/message/message.txt
sudo chmod 640 /etc/message/message.txt
```


```
apiVersion: v1
kind: Pod
metadata:
  name: my-securitycontext-pod
spec:
  securityContext:
    runAsUser: 2001
    fsGroup: 3001
  containers:
  - name: myapp-container
    image: busybox
    command: ['sh', '-c', "cat /message/message.txt && sleep 3600"]
    volumeMounts:
    - name: message-volume
      mountPath: /message
  volumes:
  - name: message-volume
    hostPath:
      path: /etc/message
 ```
