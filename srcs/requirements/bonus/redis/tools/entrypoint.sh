#!/usr/bin/env sh

######################################################################
# @author      : abaudot (aimebaudot@gmail.com)
# @file        : entrypoint
# @created     : lundi avril 25, 2022 17:49:45 CEST
#
# @description : 
######################################################################

conf_file="/etc/redis.conf"
grep -E "bind 127.0.0.1" $conf_file > /dev/null 2>&1
if [ $? -eq 0 ]; then
	sed -i "s|bind 127.0.0.1|bind 0.0.0.0|g" $conf_file
fi

grep -E "protected-mode yes" $conf_file > /dev/null 2>&1
if [ $? -eq 0 ]; then
	sed -i "s|protected-mode yes|protected-mode no|g" $conf_file
fi

redis-server /etc/redis.conf
