#!/bin/bash

ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

if [ -f "$KEY_FILE" ] then
    cp ${KEY_FILE} /root/.ssh/authorized_keys
fi
chmod 600 /root/.ssh/authorized_keys

/usr/sbin/sshd -D
