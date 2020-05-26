SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#/usr/local/bin/certbot-auto  -a \! -d /run/systemd/system &&  certbot -q renew

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Certbot renew run at: ${DATE}"


python3 -c 'from time import gmtime, strftime; strftime("%Y-%m-%d %H:%M:%S", gmtime()); import random; import time; time.sleep(random.random() * 900)' && /usr/local/bin/certbot-auto renew 2>&1

