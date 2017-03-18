default["apache"]["site"]["lal"] = { "port" => 80,"domain" => "arullaldivakar2.hq.netapp.com","site_name" => "My own first apache webserver hostsed" }
case node["platform"]
when "ubuntu"
  default["apache"]["package"] = "apache2"
when "centos"
  default["apache"]["package"] = "httpd"
end
