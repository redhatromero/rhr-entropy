#
# Cookbook Name:: rhr-entropy
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install rngd package
#

execute "rngd" do
	command "yum install rng-tools -y"
end

template "/etc/sysconfig/rngd" do
	source "rngd.erb"
	owner "root"
	group "root"
	mode "0644"
end

service "rngd" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
end
