alter user 'root'@'localhost' identified by 'your_password';
create user 'root'@'%' identified with mysql_native_password by '123456';
grant all privileges on *.* to 'root'@'%' with grant option;
flush privileges;

