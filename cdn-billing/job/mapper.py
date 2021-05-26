#!/usr/bin/env python3

"""The mapper is a little modified for the cdn billing task."""

import sys

def read_input(file):
    for line in file:
        remote_host = line.split(" ")[0].strip() # first field, strip removes any whitespace
        num_bytes = line.split(" ")[-1].strip() # second field, strip removes any whitespace (here, a newline character)
        tld = remote_host.split(".")[-1].strip() # top-level domain: com, gov, edu, etc.
        try:
            sld = remote_host.split(".")[-2].strip() # second-level domain: prodigy, nasa, etc.
        except: # some host names only have a single field, which has to be an error, so just try to handle them in some way
            sld = tld
        remote_domain = sld+"."+tld
        yield remote_domain, num_bytes

def main(separator='\t'):
    data = read_input(sys.stdin)
    for remote_domain, num_bytes in data:
        if num_bytes == '-': # handle 404 codes; 304 codes already have size 0
            num_bytes = 0
        print(remote_domain, separator, num_bytes)

if __name__ == "__main__":
    main()
