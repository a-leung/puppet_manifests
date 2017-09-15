class tfa {
  class { 'stdlib': }

  package { 'libpam-google-authenticator':
    ensure => 'installed'
  }

  file_line { 'tfa::pamd config':
    path => '/etc/pam.d/sshd',
    line => 'auth required pam_google_authenticator.so'
  }

  class { 'ssh':
    sshd_config_challenge_resp_auth => 'yes',
    subscribe                       => File_line['tfa::pamd config']
  }
}

include tfa
