#!/bin/bash

kubectl delete -f ./

helm delete horizon --purge

helm install --name horizon \
  --set persistence.enabled=false,global.postgresql.postgresqlUsername=postgres,global.postgresql.postgresqlPassword=abcd,global.postgresql.postgresqlDatabase=stellar-horizon \
    stable/postgresql

kubectl apply -f stellar-horizon-deployment.yaml
kubectl apply -f stellar-horizon-service.yaml



kubectl apply -f postgres-sc-configmap.yaml	
kubectl apply -f postgres-sc-storage.yaml
kubectl apply -f postgres-sc-deployment.yaml	
kubectl apply -f postgres-sc-service.yaml


kubectl apply -f stellar-core-deployment.yaml
kubectl apply -f stellar-core-service.yaml




