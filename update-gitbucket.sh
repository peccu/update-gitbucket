#!/bin/bash
WAR_DIR=/usr/local/opt/gitbucket/libexec
PLIST=/Library/LaunchAgents/gitbucket.plist
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
sudo launchctl unload $PLIST
sudo launchctl load $PLIST
# for local
# launchctl unload ~/Library/LaunchAgents/gitbucket.plist
# launchctl load ~/Library/LaunchAgents/gitbucket.plist
popd
