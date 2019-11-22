plays -> hosts:tasks

play -> may have multiple tasks

playbook -> may have multiple plays


productin server -  debian9

Installing docker . Steps
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}

database - centos7
sudo yum update
sudo yum install yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker


Plays always have tasks declaration and hosts declaretion

task are executed in order top down and tasks uses modules
ansible-playbook playbook.yml  // it is meean that inventory file are predifined in ansible.cfg


