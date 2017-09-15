# after successfully logging in, have pam.d send a slack message
class slack_login_notifications {
  package { 'curl':
    ensure => 'installed'
  }

  file { 'slack_login_nofitications::slack_notification.sh':
    ensure => 'file',
    path => '/usr/local/bin/slack_notification.sh',
    mode => 'ugo+x',
    source => '/vagrant/slack_notification.sh'
  }

  file_line { 'slack_login_notifications::pamd config':
    path => '/etc/pam.d/sshd',
    line => 'session   optional      pam_exec.so /usr/local/bin/slack_notification.sh'
  }
}

include slack_login_notifications
