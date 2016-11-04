# update-gitbucket

update gitbucket war file and reload for macOS(launchd) and CentOS(chkconfig, systemd).

## how to use

- copy update-gitbucket.sh to you can execute.
- modify configuration in update-gitbucket.sh
- run in shell like `update-gitbucket.sh 4.4`

## this runs...
- download war with curl
- move war
- symlink
- unload and load with launchctl

# GitBucket management scripts

- gitbucket.war is placed in `/usr/local/opt/gitbucket/libexec/gitbucket.war`(macOS) or `/root/gitbucket/gitbucket.war`(CentOS6/7).
- gitbucket home is `/opt/gitbucket/`.
- port is 8080. so you can access to http://ipaddress:8080/ . Please configure nginx etc.

## for macOS with launchd

- place `gitbucket.plist` to `/Library/LaunchAgents/gitbucket.plist` (system), or `~/Library/LaunchAgents/gitbucket.plist` (user)
- load by `sudo launchctl load /Library/LaunchAgents/gitbucket.plist` (system), or `launchctl load ~/Library/LaunchAgents/gitbucket.plist` (user)

# for CentOS6 with chkconfig

- place `start-gitbucket.sh` into `/root/start-gitbucket.sh`.
- place `gitbucket` into `/etc/init.d/gitbucket`.
- enable by `sudo chkconfig gitbucket add`.
- start to `sudo /sbin/service gitbucket start`.

# for CentOS7 with systemd

I haven't tried, but maybe this could work.

- place `gitbucket.service` into `/usr/lib/systemd/system/gitbucket.service`.

- enable by `sudo systemctl enable gitbucket.service`.
- start by `sudo systemctl start gitbucket.service`.
