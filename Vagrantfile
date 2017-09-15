Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = "vagrant.example.com"

  # http://www.terrarum.net/blog/masterless-puppet-with-vagrant.html
  config.vm.provision 'shell', run: 'once', path: 'puppet.sh'


  # https://github.com/mitchellh/vagrant/issues/3740#issuecomment-92106636
  config.vm.provision 'puppet' do |puppet|
    puppet.environment_path = 'environments'
    puppet.environment = 'production'
    puppet.module_path = 'modules'
  end
end
