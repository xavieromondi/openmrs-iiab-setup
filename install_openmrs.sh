#!/bin/bash
# ==========================================
# OpenMRS + Bahmni Setup Script for IIAB
# Author: Xavier Omondi
# ==========================================

echo "Installing Java..."
sudo apt install -y openjdk-17-jdk

echo "Installing MySQL..."
sudo apt install -y mariadb-server

echo "Downloading and extracting Tomcat..."
cd /opt
sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz
sudo tar -xzf apache-tomcat-9.0.91.tar.gz
sudo mv apache-tomcat-9.0.91 tomcat9
sudo chown -R $USER:$USER /opt/tomcat9
chmod +x /opt/tomcat9/bin/*.sh

echo "Downloading OpenMRS..."
cd /opt/tomcat9/webapps
sudo wget https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_2.3.3/openmrs.war

echo "Setting up database..."
sudo mysql < /library/www/html/openmrs-iiab-setup/mysql-setup.sql

echo "Starting Tomcat..."
/opt/tomcat9/bin/startup.sh

echo "Now open: http://localhost:8080/openmrs"
