#! /bin/sh

# Initial delay
sleep 2100

PCAP_IP_LIST=$(echo "$1" | tr "," "\n")

S3_BUCKET="$2"
while true; do
    for PCAP_IP in $PCAP_IP_LIST; do
        IP_TO_NAME=$(echo "$PCAP_IP" | sed 's/\./-/g')
        FILES=$(find . | grep "$IP_TO_NAME" | grep .pcap.gz | cut -d"/" -f2)
        sleep 15 # just in case any of the file zipping in ongoing
        for FILE in $FILES; do
            S3_PATH="$S3_BUCKET/$IP_TO_NAME/$FILE"
            echo "$S3_PATH"
            echo "$FILE"
            aws s3 cp "$FILE" "$S3_PATH"
            #aws s3 cp --quiet "$FILE" "$S3_PATH"
            rm -f "$FILE"
        done
    done
    # log rotation time
    sleep 1800
done
