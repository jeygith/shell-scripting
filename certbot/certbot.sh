SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

/usr/bin/certbot  -a \! -d /run/systemd/system &&  certbot -q renew
