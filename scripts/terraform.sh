#!/bin/bash
config="/home/buildagent/.ssh/config"
ansible="hosts"
if [ -e $config ]
then
  rm $config
fi
 cd terraform/Terraform 
 terraform init
 terraform plan
 terraform plan -out=plan.txt
 terraform apply -auto-approve
 
 production_ip=$(terraform output pd_internal_ip)
 database_ip=$(terraform output db_internal_ip)
  echo "Host github.com" >> $config
  echo "HostName github.com" >> $config
  echo "StrictHostKeyChecking no" >> $config
  echo "IdentityFile /home/buildagent/.ssh/id_rsa" >> $config  
  echo "      ">>$config
  echo "Host production" >> $config
  echo "HostName $production_ip" >> $config
  echo "StrictHostKeyChecking no" >> $config
  echo "User buildserver" >> $config
  echo "IdentityFile /home/buildagent/.ssh/bs_pd" >> $config            
  echo "      ">>$config
  echo "Host database" >> $config
  echo "HostName $database_ip" >> $config
  echo "StrictHostKeyChecking no" >> $config
  echo "User buildserver" >> $config
  echo "IdentityFile /home/buildagent/.ssh/bs_db" >> $config            
 sudo chmod 600 /home/buildagent/.ssh/config

   production_ip=$(terraform output pd_internal_ip)
   database_ip=$(terraform output db_internal_ip)
   echo "[pd]" >>$ansible
   echo "production" >>$ansible
   echo "[db]" >>$ansible
   echo "database" >> $ansible
   echo "[pd:vars]" >> $ansible
   echo "ansible_ssh_common_args='-F /home/buildagent/.ssh/config'" >> $ansible
   echo "[db:vars]" >> $ansible
   echo "ansible_ssh_common_args='-F /home/buildagent/.ssh/config'" >> $ansible
   sudo mv hosts /etc/ansible/hosts
   sudo chown root:root /etc/ansible/hosts
   sudo chmod 644 /etc/ansible/hosts