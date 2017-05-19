
#!/bin/bash

set -e
set -u

USERS=`ps aux | grep nautilus | grep -v grep | awk '{ print $1 }'`

echo "Updating logged in users' systray whitelists" >> /var/log/diva.install.log
echo "Users: $USERS" >> /var/log/diva.install.log

MAJOR_VERSION="`lsb_release -a 2>&1 | grep Release | awk '{print \$2;}' | awk -F. '{print \$1;}'`"

echo "Ubuntu version: $MAJOR_VERSION" >> /var/log/diva.install.log

# are we on Ubuntu 12.04+ ?
if [[ $MAJOR_VERSION -ge 12 ]]; then
    echo "Version high enough to update systray whitelists!" >> /var/log/diva.install.log
    for user in $USERS; do
	# does the current user not have eBeam_Stylus_Preferences in their whitelist?
	if [[ "$(su $user -c 'gsettings get com.canonical.Unity.Panel systray-whitelist')" != *eBeam_Stylus_Preferences* ]]; then
	    # get the current contents of the systray whitelist, and add on 'eBeam_Stylus_Preferences' to it
	    updated_list=$(sudo su $user -c "gsettings get com.canonical.Unity.Panel systray-whitelist | sed -e \"s/]$/, 'eBeam_Stylus_Preferences'\]/\"")
	    echo "New list for $user: $updated_list" >> /var/log/diva.install.log

	    # necessary to run gsettings from script
	    export DISPLAY=:0 
	    export GSETTINGS_BACKEND=dconf
	    su $user -c "gsettings set com.canonical.Unity.Panel systray-whitelist \"$updated_list\""
	fi
    done
fi
