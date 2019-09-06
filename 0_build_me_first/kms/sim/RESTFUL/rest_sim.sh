#!/bin/bash

MASTER_IP="192.168.86.238"
SLAVE_IP="192.168.86.239"
MASTER_PORT="7000"
SLAVE_PORT="7000"

MASTER_TARGET_VID="440110001"
SLAVE_TARGET_VID="330110002"

KEY_NUM=1
KEY_SIZE=256 #bit

SLEEP=3

RESULT_FILE="master_result.tmp"

M_PEM_FILE="kms_$SLAVE_TARGET_VID.pem"
S_PEM_FILE="kms_$MASTER_TARGET_VID.pem"

while true
do

MASTER_CMD=`/usr/bin/curl --insecure --cert ~/config/$M_PEM_FILE -X GET https://$MASTER_IP:$MASTER_PORT/api/v1/keys/$MASTER_TARGET_VID/enc_keys?number=$KEY_NUM\&size=$KEY_SIZE > $RESULT_FILE`
MASTER_KEYID_GET=`grep key_ID master_result.tmp | awk -F: '{ print $2 }' | awk -F, '{print $1}' | awk -F\" '{print $2}'`
MASTER_KEYID="$MASTER_KEYID_GET"


echo "x,x$MASTER_KEYID"
if [ "x" = "x$MASTER_KEYID" ] ; then
echo "err. MASTER_KEYID:$MASTER_KEYID"
sleep 1
continue
fi

#curl --insecure --cert $S_PEM_FILE -X POST -H "Content-Type: application/json; charset=utf-8" -d {\"key_IDs\":[{\"key_ID\":\"$MASTER_KEYID\"}]} https://$SLAVE_IP:$SLAVE_PORT/api/v1/keys/$SLAVE_TARGET_VID/dec_keys
/usr/bin/curl --insecure --cert ~/config/$S_PEM_FILE -X POST -H "Content-Type: application/json; charset=utf-8" -d {\"key_IDs\":[{\"key_ID\":\"$MASTER_KEYID\"}]} https://$SLAVE_IP:$SLAVE_PORT/api/v1/keys/$SLAVE_TARGET_VID/dec_keys
#curl --insecure --cert /home/kmsm/sim/RESTFUL/config/kms_440110001.pem  -X POST -H "Content-Type: application/json; charset=utf-8"  -d '{"key_IDs":[{"key_ID":"bc490419-7d60-487f-adc1-4ddcc177c14c490419-1da0-487f-adc1-4ddcc177c140"} ] }' https://192.168.86.239:7000/api/v1/keys/330110002/dec_keys
rm $RESULT_FILE

sleep $SLEEP
done
