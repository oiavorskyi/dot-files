function k8s-meta-cleanup -d "Removes common metadata fields from yaml output of kubect get <resource> -o yaml"
    yq eval 'del(.metadata.resourceVersion, .metadata.uid, .metadata.annotations, .metadata.creationTimestamp, .metadata.selfLink, .metadata.managedFields)' 
end
