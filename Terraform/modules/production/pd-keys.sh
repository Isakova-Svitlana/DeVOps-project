#!/bin/bash
sudo useradd -m -s /bin/bash buildserver
sudo mkdir /home/buildserver/.ssh
sudo cat /home/isakovasvitlana/bs_pd.pub >> /home/buildserver/.ssh/authorized_keys
sudo chown -R buildserver:buildserver /home/buildserver
sudo chmod 600 /home/buildserver/.ssh/authorized_keys
sudo rm /home/isakovasvitlana/bs_pd.pub
sudo rm /home/isakovasvitlana/pd-keys.sh
sudo touch buildserver
sudo echo "buildserver ALL=(ALL) NOPASSWD: ALL" > buildserver
sudo mv buildserver /etc/sudoers.d/
#sudo mkdir /home/buildserver/microservices
#sudo mkdir /home/buildserver/microservices/carts
#sudo mkdir /home/buildserver/microservices/frontend
#sudo mkdir /home/buildserver/microservices/catalog
#sudo chown -R buildserver:buildserver /home/buildserver/microservices
#sudo mv /home/isakovasvitlana/docker.sh /home/buildserver
#sudo chown -R buildserver:buildserver /home/buildserver/docker.sh
#sudo chmod +x /home/buildserver/docker.sh