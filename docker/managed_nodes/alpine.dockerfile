FROM alpine

# Ansible requires SSH and Python

# First we install and configure SSH
RUN apk add --no-cache openssh
RUN echo 'root:Passw0rd' | chpasswd
RUN sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN cd /etc/ssh
RUN ssh-keygen -A


# Now we install Python3 with pip
RUN apk add --no-cache python3
RUN apk add --no-cache py3-pip


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]