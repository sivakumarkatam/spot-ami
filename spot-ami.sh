#!/bin/bash
sudo su
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
echo "install starts"
sudo apt-get install -y python-pip
pip install --upgrade pip
pip install awscli --upgrade
pip install awscli==1.14.11
aws --version

cd /home/ubuntu
rm -rf packer/
ls -l
mkdir packer
cd packer
wget https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip
unzip packer_1.1.3_linux_amd64.zip
echo 'export PATH=$PATH:~/packer/' >> ~/.bashrc
#reboot


##docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

#versions
docker version
aws --version
#cd /home/ubuntu/packer
#packer --version
