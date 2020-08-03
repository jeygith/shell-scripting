DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "snmp pihole check at: ${DATE}"

searchString=$'extend pi-hole /etc/snmp/pi-hole\nextend osupdates /etc/snmp/osupdates'
file="/etc/snmp/snmpd.conf"
if grep -Fxq "$searchString" $file; then
  echo "String found in $file"
else
  echo "String not found in $file. Appending to file"
  echo "$searchString" >> $file
  sudo systemctl restart snmpd
fi
