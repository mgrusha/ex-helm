helm install my-app ./  
helm upgrade my-app ./  - push
helm repo list
helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm install my-postgresql stable/postgresql - add postgres
helm install my-postgresql --set image.tag=latest stable/postgresql - add with parameters
helm install my-postgresql -f my-values.yaml stable/postgresql - add with parameters from file
helm delete my-postgresql - delete postgress
https://github.com/helm/charts/tree/master/stable


helm install ingress stable/nginx-ingress --namespace kube-system - add ingress
helm delete -n kube-system ingress
helm list --all-namespaces - get information from all namespaces

helm install prometheues-operator stable/prometheus-operator --namespace metrics --set prometheusOperator.createCustomResource=false
kubectl create namespace metrics
kubectl get services -n metrics
kubectl port-forward -n metrics services/prometheues-operator-grafana  8080:80 - port forward for prometheus
helm install loki loki/loki-stack - install loki

kubectl apply -f ./ -n logging - run command
kubectl proxy --port=8001  -  port-forward

Resources:
Docker images
https://hub.docker.com/
Helm charts
https://hub.helm.sh/
https://github.com/helm/charts
https://kubernetes-charts.storage.googleapis.com/
Kubernetes:
Concepts:
Pod - basic unit contains docker containers, multiple per node
metadata.labels - array of labels used as selectors
Service ClusterIP - expose port inside cluster
Service LoadBalancer - expose port outside of cluster (via NodePort)
Ingress - nginx-ingress replaces Service LoadBalancer, maps service port to host name
ReplicaSet - take Pod template and replicate, no deploy
Deployment - ReplicaSet underneath, boosted by deployment mechanism
StatefullSet - same as deployment, but supports volumeClaimTemplates (volume is defined per pod, not shared across all of them)
PersistentVolumeClaim - storage claim, results with PersistentVolume object used in deployment as volumes
Commands:
kubectl get all —show-labels
cat deployment.yml | kubectl apply -f -
kubectl apply -f ./
kubectl delete -f ./
kubectl delete all —all
kubectl describe pods/deployment/replicaset <name>
kubectl logs <pod> -c <container> -f
kubectl exec -it <pod> sh
kubectl port-forward <pod> 8080:80
Helm:
Concepts:
Chart.yaml - Define dependencies
values.yaml - Define values used in your templates and overwrite ones from dependencies
{{ .Release.Name }} - <my-app-name> provided during install cmd (most likely used to customize unique names), template syntax for variables
{{ $fullname := printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }} - define custom variable
Commands:
helm list
helm repo list
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
helm install <nginx-ingress> stable/nging-ingress —namespace kube-system
helm install <my-app-name> ./ -f ./values.yml —set port=8080
helm upgrade <my-app-name> ./
helm dependency list
helm dependency build
helm delete <my-app-name>
helm delete $(helm list -q)



