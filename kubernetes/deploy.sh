#!/bin/bash

kubectl delete -f ./

kubectl apply -f postgres-sc-configmap.yaml	
kubectl apply -f postgres-sc-storage.yaml
kubectl apply -f postgres-sc-deployment.yaml	
kubectl apply -f postgres-sc-service.yaml

sleep 120

kubectl apply -f postgres-horizon-configmap.yaml
kubectl apply -f postgres-horizon-storage.yaml
kubectl apply -f postgres-horizon-deployment.yaml	
kubectl apply -f postgres-horizon-service.yaml	

sleep 120


kubectl apply -f stellar-core-deployment.yaml
kubectl apply -f stellar-core-service.yaml

kubectl apply -f stellar-horizon-deployment.yaml
kubectl apply -f stellar-horizon-service.yaml
