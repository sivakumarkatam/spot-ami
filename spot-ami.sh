sudo su -
apt install -y python-pip
pip install --upgrade pip
pip install awscli --upgrade

cd /home/ubuntu
mkdir packer
cd packer
wget https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip
echo 'export PATH=$PATH:~/packer/' >> ~/.bashrc
reboot


##docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

#versions
docker version
aws --version
cd /home/ubuntu/packer
packer --version
