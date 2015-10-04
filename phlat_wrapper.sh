#!/bin/bash
# Call tool with parameters
python -O /home/phlat-1.0/dist/PHLAT.py $@ 

# Fix ownership of output files
UID=$(stat -c '%u:%g' /data)
chown -R $UID /data
