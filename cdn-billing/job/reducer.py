#!/usr/bin/env python3

from operator import itemgetter
import sys

current_remote_domain = None
current_num_bytes = 0

current_connections = 0

cents_per_connection = 0.001
cents_per_gb = 0.08
dollars_per_connection = cents_per_connection/100
dollars_per_gb = cents_per_gb/100

# conversion factor from bytes to gigabytes 
to_gb = 1.0 / (1024*1024*1024)

separator='\t'

for line in sys.stdin:
    line = line.strip()

    # parse the input we got from mapper.py
    remote_domain, num_bytes = line.split('\t', 1)
    num_bytes = int(num_bytes)

    # this IF-switch only works because Hadoop sorts map output
    # by key (here: remote_domain) before it is passed to the reducer
    if current_remote_domain == remote_domain:
        current_num_bytes += num_bytes
        current_connections += 1
    else:
        if current_remote_domain:
            current_num_gb = current_num_bytes*to_gb
            current_dollars = current_connections*dollars_per_connection + current_num_gb*dollars_per_gb
            print(current_remote_domain, separator, current_connections, separator, current_num_gb, separator, current_dollars)
        current_num_bytes = num_bytes
        current_connections = 1
        current_remote_domain = remote_domain

# do not forget to output the last remote_domain if needed!
current_num_gb = current_num_bytes*to_gb
current_dollars = current_connections*dollars_per_connection + current_num_gb*dollars_per_gb
print(current_remote_domain, separator, current_connections, separator, current_num_gb, separator, current_dollars)
