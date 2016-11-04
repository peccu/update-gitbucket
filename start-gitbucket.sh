#!/bin/bash
# place this file into /root/start-gitbucket.sh

PIDFILE=/var/run/gitbucket.pid
JAVA=/usr/bin/java
PORT=8080
APPHOME=/opt/gitbucket
WARFILE=/root/gitbucket/gitbucket.war
LOGFILE=/var/log/gitbucket.log
PROXY=proxy.example.com
PROXY_PORT=8080

$JAVA -Dhttp.proxyHost=$PROXY -Dhttp.proxyPort=$PROXY_PORT -Dhttps.proxyHost=$PROXY -Dhttps.proxyPort=$PROXY_PORT -Dmail.smtp.starttls.enable=true -jar $WARFILE --gitbucket.home=$APPHOME --port=$PORT  >> $LOGFILE 2>&1 &
pid() {
  ps aux | grep $WARFILE | grep -v grep | awk '{print $2}'
}
pid >> $PIDFILE
