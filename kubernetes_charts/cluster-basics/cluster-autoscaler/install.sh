#!/bin/bash 

helm install --name cluster-autoscaler --namespace kube-system -f {{specify your values.env.yaml }} .
