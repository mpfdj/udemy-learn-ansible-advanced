https://inglearn.udemy.com/course/learn-ansible-advanced/

https://github.com/mmumshad
https://github.com/mmumshad/ubuntu-ssh-enabled

# Solutions
https://github.com/mmumshad/ansible-training-answer-keys-2

# Slack
https://kodekloud.com/pages/community

# Ansible galaxy
https://galaxy.ansible.com

# Some more resources
https://robertdebock.nl/blog.html
https://robertdebock.nl/2023/01/23/ansible-cheat-sheet.html
https://github.com/robertdebock



docker pull mmumshad/ubuntu-ssh-enabled
docker run --name target1 -d --rm mmumshad/ubuntu-ssh-enabled 
docker run --name target2 -d --rm mmumshad/ubuntu-ssh-enabled 
docker run --name target3 -d --rm mmumshad/ubuntu-ssh-enabled 

docker image build -f redhat-ubi.dockerfile -t miel1980/redhat-ssh-enabled .
docker run --name target4 -d --rm miel1980/redhat-ssh-enabled

docker inspect target1 | grep IPAddress
docker inspect target2 | grep IPAddress
docker inspect target3 | grep IPAddress

ssh <container-ip-address>
sshpass -p Passw0rd ssh root@172.17.0.2

Username: root
Password: Passw0rd


# Ansible ad-hoc command
ansible target1 -m ping -i inventory.txt



# Section 2: Web Application
https://github.com/mmumshad/simple-webapp


# IntelliJ configure a deployment to sync your local dev environment with the server
3x shift
deployment
Enable automatic upload


# Difference between 0.0.0.0 and localhost
https://serverfault.com/questions/876698/whats-the-difference-in-localhost-vs-0-0-0-0


ansible-galaxy init mysql_db
ansible-galaxy init flask_web



# Async tasks, callbacks
async

# Playbook strategy, control flow and execution of plays
serial


# Get man pages
ansible-doc debug


# Custom module
https://github.com/helloiamgio/ansible-playable
https://github.com/ansible/ansible/tree/devel/lib/ansible/modules
https://github.com/ansible
https://github.com/ansible/ansible
./library
or set environment variable ANSIBLE_LIBRARY

from ansible.module_utils.basic import AnsibleModule
module.exit_json(...)
module.fail_json(...)


# Linting
ansible-lint
yaml-lint


# Custom filters / plugins
# Add environment variable
export ANSIBLE_FILTER_PLUGINS=/filter_plugins


# Stdout (default is "skippy")
export ANSIBLE_STDOUT_CALLBACK=skippy
export ANSIBLE_STDOUT_CALLBACK=json

# Callback plugin


# Molecule
https://medium.com/@fabio.marinetti81/validate-ansible-roles-through-molecule-delegated-driver-a2ea2ab395b5
molecule init scenario -d default test-hello-is-present
molecule init scenario test-hello-is-present-docker
molecule test -s test-hello-is-present-delegate -- -i ../../inventory.ini
molecule test -s test-hello-is-present-delegate
molecule test -s test-hello-is-present-docker
molecule test --all



apt-cache show openjdk-11-jdk
apt-get install openjdk-11-jdk=11.0.14.1+1-0ubuntu1
apt-get purge openjdk*


# Goss
https://github.com/goss-org/goss
https://github.com/goss-org/goss/blob/master/docs/manual.md#available-tests
https://github.com/goss-org/goss/blob/master/docs/cli.md

# Goss Manual installation
curl -L https://github.com/goss-org/goss/releases/latest/download/goss-linux-amd64 -o /usr/local/bin/goss
chmod +rx /usr/local/bin/goss

# Goss ansible module
https://github.com/indusbox/goss-ansible/tree/master


# Install Ansible Docker collection
https://docs.ansible.com/ansible/latest/collections/community/docker/docsite/scenario_guide.html
cd udemy-learn-ansible-advanced
mkdir -p solutions/with_molecule/collections/ansible_collections
cd solutions/with_molecule/collections/ansible_collections
ansible-galaxy collection install community.docker -p . --force
ansible-galaxy collection install community.general -p . --force
pip3 install docker


# Molecule and Docker
https://ansible.readthedocs.io/projects/molecule/examples/docker/


# How to connect to the Docker host from inside a Docker container?
https://medium.com/@TimvanBaarsen/how-to-connect-to-the-docker-host-from-inside-a-docker-container-112b4c71bc66
https://docs.docker.com/desktop/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host

# Added --add-host flag
docker container run --rm --privileged --volume "C:\Users\TO11RC\OneDrive - ING\miel\workspace\Ansible_P03881_P17064-BW5_15:/tmp/ansible" --add-host=host.docker.internal:host-gateway -it ansible-8.0-redhat /bin/bash
pip3 install docker
yum install -y iproute
