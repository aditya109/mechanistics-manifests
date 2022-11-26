# Installing `helm`

1. Install via Helm.

   ```bash

    helm repo add grafana https://grafana.github.io/helm-charts

    ## Update the helm chart
    helm repo update

    ## Install helm chart with the following Stack enabled ( Loki, Promtail, Grafana, Prometheus )
    helm upgrade --install loki grafana/loki-stack --set grafana.enabled=true,prometheus.enabled=true,prometheus.alertmanager.persistentVolume.enabled=false,prometheus.server.persistentVolume.enabled=false

    ###Accessing Grafana via a Load Balancer

    kubectl patch svc loki-grafana --type merge -p '{"spec":{"type": "NodePort", "ports": [{"name": "service","port": 80,"targetPort": 3000,"nodePort":30080}]}}'
    ```
{app="loki-medium-logs",namespace="testing"}