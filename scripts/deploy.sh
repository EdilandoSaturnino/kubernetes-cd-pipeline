#!/bin/bash

if [ -z "$1" ]
then
    echo "forneça o nome da imagem docker como argumento"
    echo "uso: ./deploy.sh user/kubernetes-cd-pipeline:tag"
    exit 1
fi

IMAGE=$1
NAMESPACE=${2:-default}
DEPLOYMENT=kubernetes-cd-pipeline

kubectl set image deployment/$DEPLOYMENT $DEPLOYMENT=$IMAGE -n $NAMESPACE

kubectl rollout status deployment/$DEPLOYMENT -n $NAMESPACE

echo "deploy concluído!"