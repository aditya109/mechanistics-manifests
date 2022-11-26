# How to deploy Kafka in kubernetes locally ?

1. Type:

    ```bash
    # this would create a deployment and service for zookeeper of (NodePort type)
    kubectl apply -f zookeeper/manifest.yaml
    ```
2. Now type:

    ```bash
    kubectl apply -f manifest.yaml

    ```