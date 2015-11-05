#!/bin/bash
# Call tool with parameters
python /home/Transgene/transgene.py $@ 

# Fix ownership of output files
UID=$(stat -c '%u:%g' /data)
chown -R $UID /data
