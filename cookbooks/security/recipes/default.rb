#
# Cookbook Name:: security
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file "/etc/chef/validator.pem" do
	action :delete
end
