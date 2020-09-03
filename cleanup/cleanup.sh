DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "logs cleanup at: ${DATE}"

files=$(find /var/log -type f -name "messages.[0-9]*" -size +200k)

customFiles=$(find /Users/githire/logs/ -type f -size +200k)

echo""
echo ">>>>>>Files to delete>>>>>>>"
echo""
echo "${files[@]}" | tr ' ' '\n'
echo "${customFiles[@]}" | tr ' ' '\n'

rm -rf "${files}" "${customFiles}"
