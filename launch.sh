#!/bin/sh
rm /etc/nginx/conf.d/default.conf || :
htpasswd -bc /etc/nginx/auth.htpasswd $BASIC_USERNAME $BASIC_PASSWORD
nginx -g "daemon off;"