# https://pythonspeed.com/articles/centos-8-is-dead/
# https://hub.docker.com/u/redhat

# docker image build -f ansible-8.0-redhat-ubi.dockerfile -t ansible-8.0-miel .
# docker container run --rm --privileged -it ansible-8.0-miel /bin/bash

# docker image build --no-cache -f ansible-8.0-redhat-ubi.dockerfile -t ansible-8.0-miel .
# docker container run --rm --privileged --volume "C:\Users\TO11RC\OneDrive - ING\miel\workspace\Ansible_P03881_P17064-BW5_15:/tmp/ansible" --add-host=host.docker.internal:host-gateway --name anisble-8.0-Controller-miel -it ansible-8.0-miel /bin/bash
# docker container run --rm --privileged --volume "C:\Users\TO11RC\OneDrive - ING\miel\workspace\Ansible_P03881_P17064-BW5_15:/tmp/ansible" --add-host=host.docker.internal:host-gateway --name anisble-8.0-Controller-miel -dit ansible-8.0-miel /usr/sbin/init
# docker exec -it <CONTAINER ID> /bin/bash

FROM redhat/ubi8:8.9


# Set environment variables
ENV GIT_SSL_NO_VERIFY=true
ENV TZ=Europe/Amsterdam
ENV DOCKER_HOST=tcp://host.docker.internal:2375
ENV MOLECULE_EPHEMERAL_DIRECTORY=/tmp/molecule


# Copy repos
COPY files/repos/download-docker-com.repo /etc/yum.repos.d
COPY files/repos/rockylinux.repo /etc/yum.repos.d


# Install rpm's
RUN yum install -y vim
RUN yum install -y sshpass
RUN yum install -y git
RUN yum install -y dos2unix
RUN yum install -y net-tools
RUN yum install -y iputils
RUN yum install -y wget
RUN yum install -y procps-ng
RUN yum install -y man
RUN yum install -y zip
RUN yum install -y iproute
RUN yum install -y python3.11
RUN yum install -y python3.11-pip


# Install Ansible, with Docker driver
RUN pip3 install ansible==8.0.0
RUN pip3 install ansible-lint==24.2.0
RUN pip3 install yamllint==1.35.1
RUN pip3 install molecule==6.0.3
RUN pip3 install netaddr

# Apperantly the pip3 xml package is deprecated... not sure if xml-python is the right pacakge.
#RUN pip3 install xml
RUN pip3 install xml-python

RUN pip3 install docker
RUN yum install -y docker-ce
COPY files/ansible/ansible.cfg /etc/ansible/ansible.cfg
RUN mkdir /tmp/molecule
RUN chmod 777 /tmp/molecule


# Create aliases
RUN echo "alias ansible-playbook='ANSIBLE_LOG_PATH=\$(date +%Y%m%d%H%M%S).log ansible-playbook'" >> /root/.bashrc
#RUN echo "alias molecule='ANSIBLE_LOG_PATH=\$(date +%Y%m%d%H%M%S).log molecule'" >> /root/.bashrc
RUN echo "alias ll='ls -lha --color'" >> /root/.bashrc


# Update ca certificates
# https://www.redhat.com/sysadmin/configure-ca-trust-list
#COPY files/cacerts/rootg3_b64.crt /etc/pki/ca-trust/source/anchors
#RUN update-ca-trust

WORKDIR /tmp/ansible
