https://docs.ansible.com/ansible/latest/tips_tricks/ansible_tips_tricks.html#tip-for-variables-and-vaults
https://docs.ansible.com/ansible/5/user_guide/vault.html#encrypting-existing-files
https://www.digitalocean.com/community/tutorials/how-to-use-vault-to-protect-sensitive-ansible-data

https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#splitting-out-vars

cd group_vars
mkdir all alpine_servers
cd all
touch vars vault
Create vars and vault files

# Encrypt vault file
ansible-vault encrypt vault (set password to miel)
ansible-vault edit vault
ansible-vault view vault

# Create a vault-password file
chmod a-x password.txt
ansible-playbook --vault-password-file password.txt test_with_vault.yml
ansible-playbook --vault-password-file password.txt test_with_vault.yml -i inventory.ini
