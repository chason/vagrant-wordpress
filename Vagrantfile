Vagrant::Config.run do |config|
  config.vm.box = "lucid32"

  # Enable and configure the chef solo provisioner
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    # Tell chef what recipe to run. In this case, the `vagrant_main` recipe
    # does all the magic.
    chef.add_recipe("website")
  end
  config.vm.share_folder("website", "/var/www/", "./website")

  config.vm.forward_port("web", 80, 4567)
end

