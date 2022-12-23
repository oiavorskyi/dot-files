function kkd -a src_dir --description 'Dry run kubectl apply -k with color coding of the output'
    if test -z "$src_dir"
        set src_dir .
    end
    kubectl apply -k $src_dir --dry-run=client -o yaml | \
        yq 'del(.. | select(has("metadata")).metadata.annotations."kubectl.kubernetes.io/last-applied-configuration")' - | \
        bat -l yaml
end
