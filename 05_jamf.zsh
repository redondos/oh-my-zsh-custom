#if pgrep -f jamf &>/dev/null; then
    sudo /bin/launchctl disable system/com.jamfsoftware.jamf.agent
    sudo /bin/launchctl disable system/com.jamfsoftware.jamf.daemon
    sudo /bin/launchctl disable system/"com.jamfsoftware.task.Every 15 Minutes"
    sudo /bin/launchctl remove system/com.jamfsoftware.jamf.agent
    sudo /bin/launchctl remove system/com.jamfsoftware.jamf.daemon
    sudo /bin/launchctl remove system/"com.jamfsoftware.task.Every 15 Minutes"
#fi
