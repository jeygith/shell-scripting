EXIST=`ip route show 1.1.1.1 | wc -l`

echo ${EXIST};
echo "exists"
exit 0;

if [ $EXIST -eq 0 ]
then
    sudo ip route add 1.1.1.1/32 dev eth1
fi
if [ $EXIST -eq 1 ]
then
    sudo ip route chg 1.1.1.1/32 dev eth1
fi
