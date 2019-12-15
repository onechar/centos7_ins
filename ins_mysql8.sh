#!/bin/bash
#centos7_ins.sh
sudo yum remove mariadb*
sudo yum -y install wget
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-8.0.18-linux-glibc2.12-x86_64.tar.xz
tar -xvf mysql-8.0.18-linux-glibc2.12-x86_64.tar.xz
mv ~/mysql-8.0.18-linux-glibc2.12-x86_64 mysql
sudo mv ~/mysql /usr/local/
sudo groupadd mysql
sudo useradd -r -g mysql mysql
sudo chown -R mysql:mysql /usr/local/mysql/
sudo cp -f ~/centos7_ins/my.cnf /etc/
sudo /usr/local/mysql/bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data
sudo echo "export MYSQL_HOME" >> /etc/profile 
sudo echo "MYSQL_HOME=/usr/local/mysql" >> /etc/profile
sudo echo "export PATH=$PATH:$MYSQL_HOME/lib:$MYSQL_HOME/bin" >> /etc/profile
sudo cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql
sudo chmod +x /etc/init.d/mysql
sudo chkconfig -add mysql
