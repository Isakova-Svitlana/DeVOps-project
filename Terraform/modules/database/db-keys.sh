#!/bin/bash
sudo useradd buildserver
sudo mkdir /home/buildserver/.ssh
sudo cat /home/isakovasvitlana/bs_db.pub >> /home/buildserver/.ssh/authorized_keys
sudo chmod 600 /home/buildserver/.ssh/authorized_keys
sudo chown -R buildserver:buildserver /home/buildserver 
sudo rm /home/isakovasvitlana/bs_db.pub
sudo rm /home/isakovasvitlana/db-keys.sh
sudo touch buildserver
sudo echo "buildserver ALL=(ALL) NOPASSWD: ALL" > buildserver
sudo mv buildserver /etc/sudoers.d/
#sudo mkdir /home/buildserver/microservices
#sudo mkdir /home/buildserver/microservices/mongodb
#sudo mkdir /home/buildserver/microservices/mysql
#sudo chown -R buildserver:buildserver /home/buildserver/microservices
#sudo mv /home/isakovasvitlana/docker.sh  /home/buildserver/
#sudo chown -R buildserver:buildserver /home/buildserver/docker.sh
#sudo chmod +x /home/buildserver/docker.sh