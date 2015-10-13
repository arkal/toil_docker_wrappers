#!/bin/bash
# Call tool with parameters
script -c "python /usr/local/bin/mhc_II_binding.py $@"

# Fix ownership of output files
UID=$(stat -c '%u:%g' /data)
chown -R $UID /data
