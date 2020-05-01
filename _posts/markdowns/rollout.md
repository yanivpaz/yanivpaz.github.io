## Rollout commands 

kubectl rollout history deployment/hello
kubectl get pods -o jsonpath --template='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.spec.containers[0].image}{"\n"}{end}'




## Resources
https://www.qwiklabs.com/focuses/639?parent=catalog
