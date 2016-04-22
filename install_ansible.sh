#!/bin/bash
sudo apt-get install ansible
sudo mv /etc/ansible/hosts /etc/ansible/hosts.backup

sudo touch /etc/ansible/hosts
sudo echo '[nginx]' >> /etc/ansible/hosts
sudo echo '115.146.89.128' >> /etc/ansible/hosts
