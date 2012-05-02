#!/bin/sh
PATH=$PATH:/opt/mysql/server-5.5/bin
cd `dirname $0`/..
MY_CLUSTER=`pwd`/my_cluster

/opt/mysql/server-5.5/scripts/mysql_install_db --no-defaults --datadir=$MY_CLUSTER/mysqld_data/

