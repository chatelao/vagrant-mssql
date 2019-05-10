#!/bin/bash

echo "Updating environment..."
sudo yum -y update
sudo yum -y install wget unzip yum net-tools

echo "Install MSSQL"
sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-preview.repo
sudo yum install -y mssql-server
sudo MSSQL_PID=Developer ACCEPT_EULA=Y MSSQL_SA_PASSWORD='sa' /opt/mssql/bin/mssql-conf -n setup

echo "Open the firewall for external access"
sudo firewall-cmd --zone=public --add-port=1433/tcp --permanent
sudo firewall-cmd --reload

echo "Everything should be fine..."
