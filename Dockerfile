FROM centos:7

# system update
RUN yum -y update && yum clean all

# Set root password - you should change it after running a container
RUN echo "root:admin" | chpasswd

# Install Ansible and its dependencies
RUN yum -y install epel-release
RUN yum -y install ansible && yum clean all

RUN mkdir /temp
COPY ansible.yaml /temp
COPY hosts /temp
WORKDIR /temp
RUN ansible-playbook -i hosts ansible.yaml

WORKDIR /

CMD [ "/usr/bin/zsh" ]
