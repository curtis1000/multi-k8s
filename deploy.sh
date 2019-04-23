docker build -t curtis1000/multi-client:latest -t curtis1000/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t curtis1000/multi-server:latest -t curtis1000/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t curtis1000/multi-worker:latest -t curtis1000/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push curtis1000/multi-client:latest
docker push curtis1000/multi-server:latest
docker push curtis1000/multi-worker:latest
docker push curtis1000/multi-client:$SHA
docker push curtis1000/multi-server:$SHA
docker push curtis1000/multi-worker:$SHA
kubectl apply -f k8s

# this is the imperative step
kubectl set image deployments/server-deployment server=curtis1000/multi-server:$SHA
kubectl set image deployments/client-deployment client=curtis1000/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=curtis1000/multi-worker:$SHA
