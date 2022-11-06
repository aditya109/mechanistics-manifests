#!/bin/bash 

helm install --name k8s-spot-termination-handler --namespace kube-system .
