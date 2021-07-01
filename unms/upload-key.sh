#!/bin/bash

## set unms password, username and url in env.

declare UNMS_URL=$UNMS_URL
declare USERNAME=$UNMS_USERNAME
declare PASSWORD=$UNMS_PASS
VAULTKEY=$UNMS_VAULT_KEY

## get unms x-auth-token

authtoken=$(curl --location --request POST "${UNMS_URL}/api/v2.1/user/login" \
--header 'Accept: application/json' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode "password=${PASSWORD}" \
--data-urlencode "username=${USERNAME}" -i | grep -Fi 'x-auth-token:')

echo $authtoken
arrIN=(${authtoken//:/ })
a="${arrIN[1]}";
echo "${a}";
sleep 2
## upload unms vault key

raw_json="$(echo '{"passphrase":"pFxrbNEMg3:x((H?$zJ="}' | jq)"
echo "${raw_json}"
echo "${authtoken}"
b="$a"

a="${a// /}"
#export UNMS_SESSION="${a}"
#a=$UNMS_SESSION;

echo "a after storing in zshrc"
echo "${a}"
#echo "${a}" >> output.txt

#a='6b66e82e-55bf-4fe8-89f5-9bd52b347515';
if [ "$a" = "$b" ]
then echo "ONLINE"
  echo "$a"
else echo "OFFLINE"
fi


curl -X POST "https://unms.githire-svr.dyn.jeffgithire.dev/nms/api/v2.1/vault/credentials/unlock" \
-H "accept: application/json" \
-H "x-auth-token: ${a}" \
-H "Content-Type: application/json" \
-d "${raw_json}" \
--verbose \
--insecure


