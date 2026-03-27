kubectl-pod-resources() {
    echo -e "\033[33mpods without resources defined\033[0m"
    kubectl get pods $@ -o json | jq -r '
        .items[] |
        . as $pod |
        .spec.containers[] |
        select(
          .resources.requests == null or
          .resources == {}
        ) |
        [$pod.metadata.namespace, $pod.metadata.name, .name] | @tsv
      ' | column -t --table-columns NAMESPACE,POD,CONTAINER
}
