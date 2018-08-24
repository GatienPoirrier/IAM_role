#!/bin/bash

yum update -y
yum install httpd -y
cd /var/www/html
echo "<html><h1>Hello les minions  </h1></html>" >> index.html
service httpd start
