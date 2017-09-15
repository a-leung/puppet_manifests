class fail2ban {
  package { 'fail2ban':
    ensure => 'installed',
    status => 'start'
  }

  package { 'sendmail':
    ensure => 'installed'
  }

  file { 'jail.local':
    ensure  => 'present',
    path    => '/etc/fail2ban/jail.local',
    content => "bantime = 86400\ndestemail=your@email.domain\naction=%(action_mw)s"
  }
}

include fail2ban
