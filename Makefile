all: newkey gensecret addsshkey deploy

addsshkey:
	kubectl create -f secret.yaml

deploy:
	kubectl create -f jumpserver-service.yaml
	kubectl create -f jumpserver-rc.yaml

remove:
	kubectl delete -f jumpserver-service.yaml
	kubectl delete -f jumpserver-rc.yaml

newkey:
	rm -f sshkeys/id_rsa*
	ssh-keygen -q -f sshkeys/id_rsa -N '' -t rsa 

gensecret:
	KEY=$$(cat sshkeys/id_rsa.pub |base64) ;\
	sed "s/PUBLIC_KEY/$${KEY}/" secret.yaml.tmpl	> secret.yaml

.PHONY: newkey gensecret addsshkey deploy remove
