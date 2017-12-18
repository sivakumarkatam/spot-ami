#!/bin/bash
sudo su
sudo apt-get install -y tar
echo "install starts"
echo "java install"
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jre-8u151-linux-x64.tar.gz"
sudo tar -zxvf jre-8u*-linux-*.tar.gz
sudo mv jre1.8.*/ /usr/java
sudo update-alternatives --install /usr/bin/java java /usr/java/bin/java 2

echo "Maven install"
cd /opt/
sudo wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar -xvzf apache-maven-3.3.9-bin.tar.gz
sudo mv apache-maven-3.3.9 maven
echo '
export M2_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}' >> /etc/profile.d/mavenenv.sh
sudo chmod +x /etc/profile.d/mavenenv.sh
sudo source /etc/profile.d/mavenenv.sh
mvn --version


sudo apt-get install -y python-pip
pip install --upgrade pip
pip install awscli --upgrade
#pip install awscli==1.14.11
aws --version

echo "codedeploy agent install"
sudo apt-get install ruby
wget https://	aws-codedeploy-ap-southeast-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start
sudo service codedeploy-agent status

echo "install packer"
cd /home/ubuntu
#rm -rf packer/
ls -l
mkdir packer
cd packer
sudo wget https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip
sudo unzip packer_1.1.3_linux_amd64.zip
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
