# provisioner script to install puppet5
apt-get purge -y puppet
wget http://apt.puppetlabs.com/puppet5-release-trusty.deb
dpkg -i puppet5-release-trusty.deb
apt-get update
apt-get install -y puppet-agent
