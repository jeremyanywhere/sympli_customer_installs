Install k3s, lighteweight kubernetes distribution. 
curl -sfL https://get.k3s.io | sh -
kubectl create namespace customer1
kubectl create secret docker-registry my-dockerhub-secret \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=jeremyanywhere \
  --docker-password=d_Solomia_1 \
  --docker-email=jeremy@jeremymeyer.ai \
  -n customer2
scp -r ./kubernetes_deployments  root@66.179.189.173:/usr/local/k8s
kubectl apply -f mongodb-deployment.yaml -n customer2
kubectl apply -f fastapi-deployment.yaml -n customer1
kubectl apply -f nginx-deployment.yaml -n customer1
kubectl apply -f ingress.yaml -n customer1
#verify
kubectl get pods -n customer1

kubectl create secret tls customer1-tls --cert=./jeremymeyer.ai.crt --key=./jeremymeyer.ai.key -n customer1

#set up A record to point to URL.. e.g. customer1.jeremymeyer.ai
Don't forget to setup the database.
We also might need to map drives for the data volume:
e.g.
mkdir -p /mnt/data/customer1-mongo
mkdir -p /mnt/data/customer2-mongo
chmod -R 777 /mnt/data/customer1-mongo
chmod -R 777 /mnt/data/customer2-mongo