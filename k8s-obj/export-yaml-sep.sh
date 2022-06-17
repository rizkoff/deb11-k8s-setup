#!/bin/bash

NAMESPACED="cm ep ev limits pvc po podtemplates rc quota secrets sa svc controllerrevisions ds deploy rs sts hpa cj jobs leases ev ds deploy ing netpol rs pods netpol pdb roles rolebindings"
for ns in $(kubectl get ns --no-headers | cut -d " " -f1); do
  for kind in $NAMESPACED; do
    kubectl --namespace="${ns}" get ${kind} -o=yaml  > "yaml-sep/${ns}.${kind}.yaml"
  done
done

NON_NAMESPACED="ns no pv mutatingwebhookconfigurations validatingwebhookconfigurations crds apiservices csr nodes clusterrolebindings clusterroles pc sc volumeattachments"
for kind in $NON_NAMESPACED; do
  kubectl get ${kind} -o=yaml  > "yaml-sep/__NONS__.${kind}.yaml"
done

