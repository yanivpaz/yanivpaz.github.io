## static
-usually admin create cloud volume and pv  
-user create pvc

https://github.com/kubernetes-sigs/aws-ebs-csi-driver/tree/master/examples/kubernetes/static-provisioning

(although ebs csi driver  https://github.com/kubernetes-sigs/aws-ebs-csi-driver capable to automate all steps)


## dynamic
-admin create storage class  
-driver create pv and bind   
-user create pvc
 

### Link
https://github.com/kubernetes-sigs/aws-ebs-csi-driver/tree/master/examples/kubernetes/dynamic-provisioning


## To check 
aws-ebs-csi-driver driver is needed dynamic volume provisioning.  
is it needed also for static provisioning?
