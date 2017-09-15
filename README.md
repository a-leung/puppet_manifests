# Files for Article: Puppet Manifests Mix

These are the files for my article: [Puppet Manifests
Mix](http://redgreenrepeat.com/2017/09/15/puppet-manifests-mix/)

These manifests are individual features to install and configure for a
system:

- fail2ban (with email notifications)
- successful login email notifications
- successful login slack notifications
- two factor authentication for ssh login

# Before Using

Update email address used in:

  - /environtments/production/manifests/email_login_notifications.pp
  - /environtments/production/manifests/fail2ban.pp

Update slack webhook used in:

  - /slack_script.sh

# How to Use in Vagrant

  - Download & Install [Vagrant](https://www.vagrantup.com/downloads.html)
  - Clone repo: `git clone git@github.com:a-leung/puppet_manifests.git`
  - run: `$ vagrant up`
  - profit! :-)

# How to Use Directly

  - setup puppet 5
  - install modules (as root/super user)
  - run puppet apply (as root/super user)

More [details here](http://redgreenrepeat.com/2017/09/01/puppet-manifests-and-direct-application/#applying-puppet-directly)

Please [contact me](http://redgreenrepeat.com/contact) with any
questions or comments. I would love to hear from you.
