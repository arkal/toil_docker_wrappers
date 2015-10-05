#!/bin/bash
# Call tool with parameters
python /usr/local/bin/predict_binding.py $@ 

# Fix ownership of output files
UID=$(stat -c '%u:%g' /data)
chown -R $UID /data
