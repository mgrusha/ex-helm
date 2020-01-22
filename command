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

