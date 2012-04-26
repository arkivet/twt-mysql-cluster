#!/bin/sh
PATH=$PATH:/opt/mysql/server-5.5/bin
cd `dirname $0`/..
MY_CLUSTER=`pwd`/my_cluster

if ndb_mgm --try-reconnect=1 -e show 2>&1 >/dev/null ; then
	echo "ndb_mgd is already running" >&2
	exit 1
fi

cd $MY_CLUSTER
ndb_mgmd -f conf/config.ini --initial --configdir=$MY_CLUSTER/conf/
sleep 1
ndbd -c localhost:1186
ndbd -c localhost:1186
while ndb_mgm -e show | tee /tmp/show | egrep -q '^id=(3|4)[[:space:]].*(not connected|starting)'; do 
	echo -n '.'
	sleep 1
done
echo ''
echo "Starting mysqld"
nohup mysqld --defaults-file=conf/my.cnf &

