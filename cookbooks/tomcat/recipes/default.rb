#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


bash "install_something" do
  user "root"
  cwd "/tmp"
  code <<-EOH
   sudo apt-get install software-properties-common python-software-properties -y
   sudo add-apt-repository ppa:webupd8team/java
   send "\n"
   sudo apt-get update
  EOH
end

package "tomcat7" do
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


execute 'startomcat7' do
 cwd '/var/lib/tomcat7/conf'
 command 'sudo service tomcat7 start'
end




