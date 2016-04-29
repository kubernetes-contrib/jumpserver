all: addsshkey deploy

addsshkey:
    kubectl create -f secret.yaml

deploy:
    kubectl create -f jumpserver-service.yaml
    kubectl create -f jumpserver-rc.yaml

remove:
    kubectl delete -f jumpserver-service.yaml
    kubectl delete -f jumpserver-rc.yaml
