#
# Cookbook Name:: localusers
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
search(:users,"*:*").each do |data|
	user data["id"] do
		gid data["gid"]
		uid data["uid"]
		comment data["comment"]
		password data["passwd"]
		home data["home"]
		shell data["shell"]
	end
end

include_recipe "localusers::groups"
