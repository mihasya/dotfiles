#!/usr/bin/env python

from boto import ec2
import sys

print sys.argv

if len(sys.argv) < 3:
    raise Exception("Usage: reboot_instances.py <region> <instance-id>")

region = ec2.connect_to_region(sys.argv[1])
print region.reboot_instances([x.strip() for x in sys.argv[2].split(',')])
