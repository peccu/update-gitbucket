#!/bin/bash
# Usage
#   sudo -E update-gitbucket.sh [version]

# choose place of gitbucket.war
WAR_DIR=/usr/local/opt/gitbucket/libexec
WAR_DIR=/root/gitbucket

GITBUCKET_RELEASE_URL=https://github.com/gitbucket/gitbucket/releases/download
GITBUCKET_WAR_FILENAME=gitbucket.war

function usage(){
  echo usage: $0 version
  exit
}

if [ -z $1 ] ; then
    usage
fi

VERSION=$1

WAR_FILE_WITH_VERSION=${GITBUCKET_WAR_FILENAME%%.*}_$VERSION.${GITBUCKET_WAR_FILENAME##*.}
curl -L -o $WAR_FILE_WITH_VERSION $GITBUCKET_RELEASE_URL/$VERSION/$GITBUCKET_WAR_FILENAME
sudo mv $WAR_FILE_WITH_VERSION $WAR_DIR/
pushd $WAR_DIR
sudo rm gitbucket.war
sudo ln -s $WAR_FILE_WITH_VERSION gitbucket.war

# Enable you need

# for CentOS6 (chkconfig)
# using gitbucket script and start-gitbucket.sh
# sudo /sbin/service gitbucket restart
# for CentOS7 (systemd)
# using gitbucket script and start-gitbucket.sh
# sudo systemctl restart gitbucket.service
# for macOS (system wide)
# sudo launchctl unload /Library/LaunchAgents/gitbucket.plist
# sudo launchctl load /Library/LaunchAgents/gitbucket.plist
# for macOS (user local)
# launchctl unload ~/Library/LaunchAgents/gitbucket.plist
# launchctl load ~/Library/LaunchAgents/gitbucket.plist
popd
