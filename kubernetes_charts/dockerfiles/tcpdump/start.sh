#! /bin/sh

PCAP_IP_LIST=$(echo "$1" | tr "," "\n")

echo "List of IPs $PCAP_IP_LIST"

S3_BUCKET="$2"

echo "S3_BUCKET $S3_BUCKET"

./upload_pcap.sh "$PCAP_IP_LIST" "$S3_BUCKET" & ./capture_pcap.sh "$PCAP_IP_LIST"