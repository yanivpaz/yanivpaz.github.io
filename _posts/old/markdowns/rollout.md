# Built in upgrade methods
## Rolling upgrade  

View status :
```
kubectl get pods -o jsonpath --template='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.spec.containers[0].image}{"\n"}{end}'
```

### Trigger:
```
kubectl set image deployment/hello hello=kelseyhightower/hello:2.0.0
kubectl rollout history deployment/hello
```

## Canary
Already have deployment with 
- replicas: 3
- version: 1.0.0
- image: kelseyhightower/hello:1.0.0

### Trigger
Create another deployment with 
- replicas: 1
- version: 1.0.0
- image: kelseyhightower/hello:2.0.0
 
Check ( run 4 times) 
```
curl -ks https://`kubectl get svc frontend -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"`/version
```
 
## Blue - green 
1. Already have deployment
2. Create new deployment as 1 but and change
- image to 2.0
- label 2.0

### Trigger
update the service to select label 2.0



## Resources
https://www.qwiklabs.com/focuses/639?parent=catalog
