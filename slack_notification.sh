#!/bin/bash

function post_to_slack () {
    # format message as a code block ```${msg}```
    SLACK_MESSAGE="\`\`\`$1\`\`\`"
    SLACK_URL=http://slack.generated.webhook/services/xx...x/yy...y/zz....z

    case "$2" in
	INFO)
	    SLACK_ICON=':slack:'
	    ;;
	WARNING)
	    SLACK_ICON=':warning:'
	    ;;
	ERROR)
	    SLACK_ICON=':bangbang:'
	    ;;
	*)
	    SLACK_ICON=':slack:'
	    ;;
    esac

    curl -X POST --data "payload={\"text\": \"${SLACK_ICON} ${SLACK_MESSAGE}\", \"username\": \"login-bot\"}" ${SLACK_URL}
}

USER="User:        $PAM_USER"
REMOTE="Remote host: $PAM_RHOST"
SERVICE="Service:     $PAM_SERVICE"
TTY="TTY:         $PAM_TTY"
DATE="Date:        `date`"
SERVER="Server:      `uname -a`"
LOGINMESSAGE="$PAM_SERVICE login on `hostname -s` for account $PAM_USER"

if [ "$PAM_TYPE" == "open_session" ]
then
    post_to_slack "${LOGINMESSAGE}\n${USER}\n${REMOTE}\n${SERVICE}\n${TTY}\n${DATE}\n${SERVER}" "INFO"
fi
exit 0
