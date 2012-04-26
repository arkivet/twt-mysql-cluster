#!/bin/sh
PATH=$PATH:/opt/mysql/server-5.5/bin
mysqladmin -u root -h 127.0.0.1 -P 5000 shutdown
ndb_mgm --try-reconnect=1 -e shutdown

