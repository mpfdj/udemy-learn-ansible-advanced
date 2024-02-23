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

docker inspect target1 | grep IPAddress
docker inspect target2 | grep IPAddress
docker inspect target3 | grep IPAddress

ssh <container-ip-address>

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