#!/bin/bash

# Add Ansible PPA
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Update package list
sudo apt update

# Install Ansible
sudo apt install -y ansible

# Verify installation
ansible --version

# Backup the original config file
sudo cp /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak

# Append or overwrite the [defaults] section
sudo tee -a /etc/ansible/ansible.cfg > /dev/null <<EOL

[defaults]
inventory = inventory_aws_ec2.yaml
host_key_checking = False
ansible_ssh_user = ubuntu
private_key_file = /home/ubuntu/project.pem
EOL

# Confirm update
echo "Updated /etc/ansible/ansible.cfg with new defaults."
