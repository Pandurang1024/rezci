# Encoding: utf-8
#
# Cookbook Name:: jenkinsstack
# Recipe:: default
#
# Copyright 2014, Rackspace
#
# Gracefully handle the failure for an invalid installation type



#cookbook_file "/etc/apache2/sites-available/jenkins.conf" do
 # source "jenkins.conf"
 # mode "0644"
#end


cookbook_file "/opt/jenkins.sh" do
  source "jenkins.sh"
  mode "0677"
end



cookbook_file "/opt/jenkins.sh" do
  source "jenkins.sh"
  mode "0677"
end

#bash "jenkins" do
 # guard_interpreter :bash
  #code "opt/jenkins.sh"
#end


execute 'startomcat7' do
 cwd '/opt'
 command 'sudo sh jenkins.sh'
end


directory "/var/lib/jenkins/.ssh" do
 owner 'jenkins'
 group 'root'
 mode '0755'
 action :create
end


cookbook_file "/etc/sudoers" do
  source "sudoers"
  mode "0444"
end
