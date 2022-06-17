#!/bin/bash

DATETIME=`date +"%Y%m%d%H%M%S"`
mkdir -p ./yaml/$DATETIME

# NAMESPACED EXPORTS
for ns in $(kubectl get ns --no-headers | cut -d " " -f1); do
	  kubectl --namespace="${ns}" get -o=yaml bindings,cm,ep,ev,limits,pvc,po,podtemplates,rc,quota,secrets,sa,svc,controllerrevisions,ds,deploy,rs,sts,localsubjectaccessreviews,hpa,cj,jobs,leases,ev,ds,deploy,ing,netpol,rs,pods,netpol,pdb,roles,rolebindings  >> "yaml/$DATETIME/${ns}.yaml"
  done

  # NON-NAMESPACED EXPORTS
  kubectl get -o=yaml cs,ns,no,pv,mutatingwebhookconfigurations,validatingwebhookconfigurations,crds,apiservices,tokenreviews,selfsubjectaccessreviews,selfsubjectrulesreviews,subjectaccessreviews,csr,psp,nodes,psp,clusterrolebindings,clusterroles,pc,sc,volumeattachments >> "yaml/$DATETIME/cluster_non-namespaced_export.yaml"

