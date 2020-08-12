DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "/var/logs/messages cleanup at: ${DATE}"

files=$(find /var/log -type f -name "messages" -size +500k)

if [ -z "$files" ]; then
  echo "\$files is empty"
else
  echo "${files[@]}" | tr ' ' '\n'
  rm -rf "${files}"
  systemctl restart rsyslog
fi
