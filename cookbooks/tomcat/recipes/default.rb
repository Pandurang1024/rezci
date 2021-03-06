#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


bash "install_software_properties" do
  user "root"
  cwd "/tmp"
  code <<-EOH
 sudo apt-get install software-properties-common python-software-properties -y
  EOH
end


bash "install_java_prop8" do
  user "root"
  cwd "/tmp"
  code <<-EOH
 echo -ne '\n' | sudo add-apt-repository ppa:webupd8team/java
 sudo apt-get update
 
  EOH
end


bash "update" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  sudo apt-get update
  EOH
end


bash "install_java8" do
  user "root"
  cwd "/tmp"
  code <<-EOH
 echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
 sudo apt-get install oracle-java8-set-default -y
 sudo apt-get install maven -y
  EOH
end





package "tomcat7" do
	action :install
end

#sudo apt-get install tomcat7-admin
package "tomcat7-admin" do
action :install
end



execute 'stoptomcat7' do
 cwd '/var/lib/tomcat7/conf'
 command 'sudo service tomcat7 stop'
end

execute 'removeoldserverxml' do
 cwd '/var/lib/tomcat7/conf'
 command 'sudo rm server.xml'
end

cookbook_file "/var/lib/tomcat7/conf/server.xml" do
  source "server.xml"
  mode "0644"
end

execute 'removeolduserxml' do
 cwd '/var/lib/tomcat7/conf'
 command 'sudo rm tomcat-users.xml'
end

cookbook_file "/var/lib/tomcat7/conf/tomcat-users.xml" do
  source "tomcat-users.xml"
  mode "0644"
end


cookbook_file "/var/lib/tomcat7/webapps/Calendar.war" do
  source "Calendar.war"
  mode "0644"
end

execute 'startomcat7' do
 cwd '/var/lib/tomcat7/conf'
 command 'sudo service tomcat7 start'
end

execute 'stoptomcat7' do
 cwd '/opt'
 command 'sudo service tomcat7 start'
end



