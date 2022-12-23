function kkd --description 'Dry run kubectl apply -k with color coding of the output'
    set src_dir $1
    if test -n $1
        set src_dir .
    end
    kubectl apply -k $src_dir --dry-run=client -o yaml | \
        yq 'del(.. | select(has("metadata")).metadata.annotations."kubectl.kubernetes.io/last-applied-configuration")' - | \
        bat -l yaml
end
