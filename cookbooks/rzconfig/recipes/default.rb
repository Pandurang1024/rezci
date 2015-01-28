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
   sudo apt-get install python-software-properties
   sudo add-apt-repository ppa:chris-lea/node.js
   send "\n"
   sudo apt-get update
   sudo apt-get install npm nodejs-legacy -y
   sudo apt-get install nodejs -y
   sudo apt-get install nodejs-dev -y
   sudo npm install -g bower
   sudo npm install -g yo
   sudo npm install -g grunt-cli
   sudo apt-get install ruby1.9.1-dev -y
   sudo gem install compass
   sudo apt-get install xvfb -y
   sudo apt-get install firefox -y
   
 EOH
end

