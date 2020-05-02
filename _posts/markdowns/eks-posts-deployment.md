| ID | Item        | Why its needed           | Link   | Remarks 
| ---| ------------- | :-------------| :-----| :-----|
|1| Dashboard       | view K8s dashboard  | https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html |
|2| AppMesh    | Integration with AWS AppMesh     |  https://github.com/aws/aws-app-mesh-controller-for-k8s |
|3| Storage integration (CSI)  |  Container Storage Interface (CSI) Driver provides a CSI interface used by Container Orchestrators to manage the lifecycle of Amazon EBS volumes.    | https://github.com/kubernetes-sigs/aws-ebs-csi-driver    |
|4| Node drainer |  Gracefull shutdown of EC2 isntances      |  https://github.com/aws-samples/amazon-k8s-node-drainer   |
|5| Worker nodes logs  |  Collect all worker nodes logs to elastic / other log aggregator     |  https://eksworkshop.com/intermediate/230_logging/deploy/   |
|6| Service operator  |  Create cloud resources using kubernetes API . like in [GCP cloud connector](https://cloud.google.com/config-connector/docs/overview)      |   https://github.com/aws/aws-service-operator-k8s  |
|7| Monitoring | EKS quick start comes with Prometheus.   you probably dont want to use it .      |   https://eksworkshop.com/intermediate/240_monitoring/  |
|8| ALB integration  |  ALB integration    |   https://github.com/kubernetes-sigs/aws-alb-ingress-controller    |
|9| External DNS  | Route53 integration       |  https://github.com/kubernetes-sigs/external-dns   |
|10| Cluster auto scalar| adjusts the number of nodes in your cluster when pods fail to launch due to lack of resources or when nodes in the cluster are underutilized and their pods can be rescheduled onto other nodes in the cluster.| https://docs.aws.amazon.com/eks/latest/userguide/cluster-autoscaler.html
|11| Horizontal pod autoscalar |automatically scales the number of pods in a deployment, replication controller, or replica set based on that resource's CPU utilization. | https://docs.aws.amazon.com/eks/latest/userguide/horizontal-pod-autoscaler.html
|12| Netowrking integration (CNI) |  Networking plugin for pod networking in Kubernetes using Elastic Network Interfaces on AWS.     |   https://github.com/aws/amazon-vpc-cni-k8s/blob/master/README.md  |
|13| CNI metrics helper  |  scrape elastic network interface and IP address information, aggregate metrics at the cluster level     |   https://docs.aws.amazon.com/eks/latest/userguide/cni-metrics-helper.html  |
|14| Spot handler | handle Spot interruptions. |https://eksworkshop.com/spotworkers/deployhandler/
|15| RBAC | simplify authorization in Kubernetes |https://github.com/FairwindsOps/rbac-manager/blob/master/docs/aws.md






  


