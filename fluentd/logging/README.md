# Install fluentd-logging

1. Install the manifests
    ```bash
    kubectl apply -f namespace.yaml
    kubectl apply -f elasticsearch.yaml
    kubectl apply -f kibana.yaml
    kubectl apply -f fluent.yaml
    ```

2. Now go to kibana endpoint. http://MINIKUBE_IP:30601/
3. Click on *Discover* > *Create index pattern*.
4. For the index pattern, enter `logstash-*`. Click **Next**.
5. For *Time Filter field name*, select `@timestamp`. Now click **Create index pattern**.
6. Hit Discover to view *logstash* logs.
