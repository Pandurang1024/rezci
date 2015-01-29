# Encoding: utf-8
#
# Cookbook Name:: jenkinsstack
# Recipe:: default
#


execute 'addJenkins' do
 cwd '/var'
 command 'sudo wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -'
end

execute 'addList' do
 cwd '/var'
 command 'sudo sh -c \'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list\''
end

execute 'updtsys' do
 cwd '/var'
 command 'sudo apt-get update'
end

package "jenkins" do
action :install
end



cookbook_file "/etc/sudoers" do
  source "sudoers"
  mode "0444"
end
