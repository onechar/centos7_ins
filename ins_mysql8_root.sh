#!/bin/bash
#centos7_ins.sh
yum remove mariadb*
yum -y install wget
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-8.0.18-linux-glibc2.12-x86_64.tar.xz
tar -xvf mysql-8.0.18-linux-glibc2.12-x86_64.tar.xz
mv ~/centos7_ins/mysql-8.0.18-linux-glibc2.12-x86_64 mysql
mv ~/centos7_ins/mysql /usr/local/
groupadd mysql
useradd -r -g mysql mysql
chown -R mysql:mysql /usr/local/mysql/
cp -f ~/centos7_ins/my.cnf /etc/
/usr/local/mysql/bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data
echo "export MYSQL_HOME" >> /etc/profile
echo "MYSQL_HOME=/usr/local/mysql" >> /etc/profile
echo "export PATH=$PATH:$MYSQL_HOME/lib:$MYSQL_HOME/bin" >> /etc/profile
cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql
chmod +x /etc/init.d/mysql
chkconfig -add mysql
