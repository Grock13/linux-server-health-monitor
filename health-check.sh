#!/bin/bash

REPORT="health-report-$(date +%Y-%m-%d-%H%M%S).txt"

echo "Creating server health report..."

{
echo "=============================="
echo "SERVER HEALTH REPORT"
echo "=============================="

echo ""
echo "Date and Time:"
date

echo ""
echo "Hostname:"
hostname

echo ""
echo "Current User:"
whoami

echo ""
echo "System Uptime:"
uptime

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "Top 5 Memory-Using Processes:"
ps aux --sort=-%mem | head -n 6

echo ""
echo "Network Information:"
ip addr

echo ""
echo "=============================="
echo "END OF REPORT"
echo "=============================="
echo ""
echo "Disk Warning Check:"

DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is above 80%."
else
    echo "Disk usage is healthy."
fi
} > "$REPORT"

echo "Report created:"
echo "$REPORT"
