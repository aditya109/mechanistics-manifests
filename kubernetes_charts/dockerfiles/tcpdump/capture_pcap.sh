#! /bin/sh

PCAP_IP_LIST=$(echo $1 | tr "," "\n")
LOG_ROTATE_TIME=1800

echo "List of IPs $PCAP_IP_LIST"
echo "Log rotate time $LOG_ROTATE_TIME"
INSTANCE_ID=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id)
echo "$INSTANCE_ID"
while true; do
    for PCAP_IP in $PCAP_IP_LIST; do
        # for now limiting to one IP, later can be enhanced to multiple IPs
        IP_TO_NAME=$(echo "$PCAP_IP" | sed 's/\./-/g')
        echo "Starting to capture pcap for $PCAP_IP"
        tcpdump -G "$LOG_ROTATE_TIME" -ttti any host "$PCAP_IP" -s 0 -w ./"$IP_TO_NAME-$INSTANCE_ID"-%m-%d-%Y-%H-%M.pcap -z gzip
    done
    echo "pcap capturing is stopped or there are no IPs listed"
    sleep infinity
done
