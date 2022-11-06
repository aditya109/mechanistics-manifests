#!/bin/bash 

helm install --name k8s-spot-rescheduler --namespace kube-system .
