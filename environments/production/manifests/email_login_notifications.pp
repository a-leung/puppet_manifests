# after successfully logging in, have pam.d send email notifications
class email_login_notifications {
  package { 'mailutils':
    ensure => 'installed'
  }

  file_line { 'email_login_notifications::pamd_config':
    path => '/etc/pam.d/sshd',
    line => 'session   optional      pam_exec.so /usr/local/bin/send_email.sh'
  }

  file { 'email_login_notifications::send_email.sh':
    ensure => 'file',
    path => '/usr/local/bin/send_email.sh',
    mode => 'ugo+x',
    content => "#!/bin/sh
    if [ \"\$PAM_TYPE\" = \"open_session\" ]
    then
    {
      echo \"User: \$PAM_USER\"
      echo \"Remote Host: \$PAM_RHOST\"
      echo \"Service: \$PAM_SERVICE\"
      echo \"TTY: \$PAM_TTY\"
      echo \"Date: `date`\"
      echo \"Server: `uname -a`\"
      } | mail -s \"\$PAM_SERVICE login on `hostname -s` for account \$PAM_USER\" your@email.domain
      fi
      exit 0
      "
  }
}


include email_login_notifications
