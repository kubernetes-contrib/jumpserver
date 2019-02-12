FROM centos:7

RUN yum -y install openssh openssh-clients openssh-server curl
EXPOSE 22

RUN mkdir -p /root/.ssh
ENV KEY_FILE=/tmp/authorized_keys

COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
