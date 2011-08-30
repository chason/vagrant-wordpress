# Run apt-get update before the chef convergence stage
r = execute "apt-get update" do
  user "root"
  command "apt-get update"
  action :nothing
end
r.run_action(:run)

# include_recipe "chef"
include_recipe "git"
include_recipe "build-essential"
include_recipe "wordpress"
