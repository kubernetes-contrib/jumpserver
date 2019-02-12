FROM centos:7

RUN yum -y install openssh openssh-clients openssh-server
EXPOSE 22

COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
