alias kg='kubectl get'
alias kd='kubectl describe'

alias kcgc='kubectl config get-contexts'

alias kgpa='kubectl get pods --all-namespaces'

alias kgj='kubectl get job'
alias kdj='kubectl describe job'

alias kgc='kubectl get cronjob'
alias kdc='kubectl describe cronjob'

alias kgn='kubectl get node'
alias kdn='kubectl describe node'


kubejobs() {
  kubectl get pods  --show-all --selector=job-name=$1 --output=jsonpath="{.items..metadata.name}"
}

kns() {
  if [[ -n $1 ]]; then
    export TILLER_NAMESPACE=$1
    kubectl config set-context $(kubectl config current-context) --namespace $1
  else
    unset TILLER_NAMESPACE
    kubectl config set-context $(kubectl config current-context) --namespace kube-system
fi
}

alias ktt='kubectl get secret $(kubectl get sa tiller -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 -D && echo ""'

export KUBECONFIG=${(fj.:.)$(print -l ~/.kube/config*)}

    #kubectl get secret -n monitoring kube-prometheus-grafana -o jsonpath='{.data.password}' | base64 -D
get-secret() {
    kubectl get secret $1 -o jsonpath="{.data.$2}" | base64 -D; echo
}

helm-replicas() {
  if (($#@ == 2)); then
    kubectl patch deployment $1 -p '{"spec": {"replicas": '$2'}}'
  else
    echo usage: helm-replicas DEPLOYMENT REPLICAS
  fi
}

kube-secret() {
    if [[ -z $1  ]]; then
        echo pass cluster name
    else
        KOPS_STATE_STORE="s3://10gen-platform" kops get secrets --name=$1.k8s.local kube -oplaintext
    fi
}

kroll() {
  if [[ -n $1 ]]; then
    kubectl patch deployment "$1" -p "{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"date\":\"$(date +'%s')\"}}}}}"
  else
    echo 'Usage: kroll <deployment>'
  fi
}

pod-restart-reason() {
  kubectl get pod -o go-template='{{range.status.containerStatuses}}{{"Container Name: "}}{{.name}}{{"\r\nLastState: "}}{{.lastState}}{{end}}' $1
}

kube-router-elb() {
    host $(kubectl get svc -n routing $1 -ojsonpath='{.status.loadBalancer.ingress[0].hostname}')
}

function makisu_build() {
    makisu_version=${MAKISU_VERSION:-v0.1.8}
    cd ${@: -1}
    docker run -i --rm --net host \
        -v /var/run/docker.sock:/docker.sock \
        -e DOCKER_HOST=unix:///docker.sock \
        -v $(pwd):/makisu-context \
        -v /tmp/makisu-storage:/makisu-storage \
        gcr.io/makisu-project/makisu:$makisu_version build \
            --modifyfs=true --load \
            ${@:1:-1} /makisu-context
    cd -
}
