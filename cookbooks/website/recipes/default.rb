
include_recipe "git"
include_recipe "build-essential"
include_recipe "apache2"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"

if node.has_key?("ec2")
    server_fqdn = node['ec2']['public_hostname']
else
    server_fqdn = node['fqdn']
end

web_app "website" do
    template "website.conf.erb"
    docroot "#{node['website']['dir']}"
    server_name server_fqdn
    server_aliases node['fqdn']
end

