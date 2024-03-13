# https://pythonspeed.com/articles/centos-8-is-dead/
# https://hub.docker.com/u/redhat
# https://stackoverflow.com/questions/59466250/docker-system-has-not-been-booted-with-systemd-as-init-system
# https://linuxconfig.org/redhat-8-enable-ssh-service

# docker image build -f redhat-ubi.dockerfile -t miel1980/redhat-ssh-enabled .
# docker container run --rm --privileged -it miel1980/redhat-ssh-enabled /bin/bash


FROM redhat/ubi8:8.9

# Set environment variables
ENV GIT_SSL_NO_VERIFY=true
ENV TZ=Europe/Amsterdam

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

# Create alias
RUN echo "alias ll='ls -lha --color'" >> /root/.bashrc

# Configure ssh
RUN yum install -y openssh-server
RUN echo 'root:Passw0rd' | chpasswd
RUN cd /etc/ssh
RUN ssh-keygen -A


WORKDIR /tmp

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]