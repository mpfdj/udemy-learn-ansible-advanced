https://docs.ansible.com/ansible/latest/tips_tricks/ansible_tips_tricks.html#tip-for-variables-and-vaults
https://docs.ansible.com/ansible/5/user_guide/vault.html#encrypting-existing-files
https://www.digitalocean.com/community/tutorials/how-to-use-vault-to-protect-sensitive-ansible-data

https://www.cloudwerkstatt.com/en/ansible-vault-and-vault-id/

https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#splitting-out-vars



cd group_vars
mkdir all alpine_servers
cd all
touch vars.yml vault.yml
Create vars.yml and vault.yml files

# Encrypt vault file
ansible-vault encrypt vault.yml (set password to miel)
ansible-vault encrypt --vault-id dev@prompt vault_dev.yml
ansible-vault edit vault.yml
ansible-vault view vault.yml

# Create a vault-password file
chmod a-x password.txt
ansible-playbook --vault-password-file password.txt test_with_vault.yml
ansible-playbook --vault-password-file password.txt test_with_vault.yml -i inventory.ini

# Create vault with ID
cd vaults
ansible-vault create --vault-id dev@prompt dev.yml
ansible-vault create --vault-id prd@prompt prd.yml

# Run the test_with_vault.yml playbook using --vault-id (you can specify prompt or a file)
ansible-playbook test_with_vault.yml --vault-id dev@vaults/password_dev.txt --vault-id prd@vaults/password_prd.txt --vault-password-file password.txt

# Run the test_with_vault.yml playbook using --vault-password-file
ansible-playbook test_with_vault.yml --vault-password-file password.txt --vault-password-file vaults/password_dev.txt --vault-password-file vaults/password_prd.txt


# Run below command to variables, useful when debugging
ansible -m debug -a 'var=hostvars[inventory_hostname]' alpine_servers --ask-vault-pass -i inventory.ini


#--------------------------------
# ==> Ansible tips and tricks <==
#--------------------------------
https://docs.ansible.com/ansible/latest/tips_tricks/index.html





ansible-console -i inventory/usa.yml
$ list
$ list groups


cd inventory
ansible-inventory -i usa.yml --graph


#--------------------------------
# ==> Ansible sample setup <==
#--------------------------------
https://docs.ansible.com/ansible/latest/tips_tricks/sample_setup.html
