#!/bin/bash
# Call tool with parameters
/usr/local/bin/rsem-calculate-expression $@ 

# Fix ownership of output files
UID=$(stat -c '%u:%g' /data)
chown -R $UID /data