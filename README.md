SSHD Jump server for Kubernetes
===============================

# What's this

## Docker image

Centos:7 with openssh installed.


## Kubernetes files

Start the sshd server in Kubernetes. The server can be used as jumpbox to access Kubernetes inernal network.


# How to deploy in Kubernetes

TLDR;

```
make all
kubectl describe service sshd-jumpserver
ssh -i sshkeys/idrsa root@${LoadBalancer Ingress address}
```

## Generate your ssh key

generate the id_rsa key or copy your own key to sshkeys folder

```
make newkey
```

## Encode the ssh key with bas64 and create secrets file

```
make gensecret
make addsshkey
```

## create service and deployment

```
make deploy
```

## find the endpoint and ssh to the jump server

```
kubectl describe service sshd-jumpserver

Name:           sshd-jumpserver
Namespace:      default
Labels:         name=sshd-jumpserver
Selector:       app=sshd-jumpserver
Type:           LoadBalancer
IP:         10.0.43.1
LoadBalancer Ingress:   ac646353e0e3e11e6bd02065967720c2-558922547.us-west-1.elb.amazonaws.com
Port:           ssh 22/TCP
NodePort:       ssh 30583/TCP
Endpoints:      10.244.4.10:22
Session Affinity:   None
No events.
```

then you can ssh to the jump server with the private key

```
ssh -i sshkeys/id_rsa root@ac646353e0e3e11e6bd02065967720c2-558922547.us-west-1.elb.amazonaws.com

Warning: Permanently added the ECDSA host key for IP address '54.219.157.181' to the list of known hosts.
[root@sshd-jumpserver-oj6bv ~]#
```


## delete service and deployment

```
make remove
```