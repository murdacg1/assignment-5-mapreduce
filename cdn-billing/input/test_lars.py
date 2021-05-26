#!/usr/bin/env python3

import io
from lars import apache

with io.open('apache_log_UTF8_test_short.txt') as f:
    with apache.ApacheSource(f) as source:
        for row in source:
            #print(row)
            print(row.remote_host, row.status, row.size)
            #print()
