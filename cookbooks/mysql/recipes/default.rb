#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "mysql-server" do	
action :install
end

package "mysql-client" do
action :install
end

execute 'createusr' do
 cwd '/var'
 command 'mysql -u root -e "CREATE USER \'rezoomex\'@\'localhost\' IDENTIFIED BY \'password55##\'";'
end


execute 'createdb' do
cwd '/var'
command 'mysql -u root -e "CREATE database IF NOT EXISTS rezoomex";'
end

execute 'usedb' do
cwd '/var'
command 'mysql -u root -e "use rezoomex";'
end


execute 'grantdb' do
cwd '/var'
command 'mysql -u root -e "grant all on rezoomex.* to \'rezoomex\'@\'localhost\' identified by \'password55##\'";'
end

 