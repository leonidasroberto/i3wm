#!/bin/bash
source=$(free -h | grep Mem)
total=$(echo $source | awk '{print $2}')
used=$(echo $source | awk '{print $3}')
echo "$used/$total"