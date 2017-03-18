
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "apache" do
        package_name node["apache"]["package"]
end


node["apache"]["site"].each do |sitename ,data|

  document_root = "/tmp/content/#{sitename}"
  
  directory document_root do
	mode "755"
        recursive true 
  end

if node["platform"] == "centos"
   doc_dir = "/etc/httpd/conf.d/#{sitename}.conf"
elsif node["platform"] == "ubuntu"
   doc_dir = "/etc/apache2/conf.d/#{sitename}.conf"
end



template doc_dir do
  	source "vhost.erb"
        mode "777"
        variables(
        	:document_dir => document_root,
        	:port => data["port"],
        	:domain => data["domain"]
        ) 
        notifies :restart, "service[httpd]"
end

template "/tmp/content/#{sitename}/index.html" do
	source "index.html.erb"
	mode "777"
        variables(
               :site_name => data["site_name"]
        )
end
end 

execute "rm /etc/httpd/conf.d/welcome.conf" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
        end
        notifies :restart,"service[httpd]"
end

service "httpd" do
        service_name  node["apache"]["package"]
	action [:enable, :start]
end

##include_recipe "php::default"
