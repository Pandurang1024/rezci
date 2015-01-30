#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


bash "install_python_sw" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  sudo apt-get install software-properties-common python-software-properties -y
  EOH
end


bash "install_python_sw" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  sudo apt-get update
  EOH
end


bash "install_python_sw" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  sudo apt-get install software-properties-common python-software-properties -y
  EOH
end

bash "install_nodejs" do
  user "root"
  cwd "/tmp"
  code <<-EOH
   echo -ne '\n' | sudo add-apt-repository ppa:chris-lea/node.js
   
   EOH
end



bash "install_npm" do
  user "root"
  cwd "/tmp"
  code <<-EOH
   sudo apt-get install npm nodejs-legacy -y
   sudo apt-get install nodejs -y
   sudo apt-get install nodejs-dev -y
 EOH
end

bash "install_yoman" do
  user "root"
  cwd "/tmp"
  code <<-EOH
   sudo npm install -g bower
   sudo npm install -g yo
   sudo npm install -g grunt-cli
   sudo apt-get install ruby1.9.1-dev -y
   sudo gem install compass
 EOH
end


bash "install_xvfb_ff" do
  user "root"
  cwd "/tmp"
  code <<-EOH
   sudo apt-get install xvfb -y
   sudo apt-get install firefox -y
 EOH
end

