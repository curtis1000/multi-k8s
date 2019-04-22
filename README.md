# Prerequisites

docker, kubectl, and minikube

# Setup

Fire up the dev host
```
minikube start
```

Declare your db password in a secret (can be anything):
```
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
```

Apply Kubernetes Configuration
```
kubectl apply -f k8s
```

View this site
```
open https://`minikube ip`
```
