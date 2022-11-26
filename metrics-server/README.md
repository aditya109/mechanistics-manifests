# Installing `metrics-server`

1. Install `components.yaml`.
    ```bash
    k apply -f components.yaml
    ```

2. Directly enable `metrics-server`.
    ```bash
    minikube addons enable metrics-server
    ```