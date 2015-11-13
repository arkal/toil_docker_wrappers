#!/bin/bash
set -e

finish() {
    # Fix ownership of output files
    UID=$(stat -c '%u:%g' /data)
    chown -R $UID /data
}
trap finish EXIT

# Need to set this for the tool to run
export USER='user'

# Call tool with parameters
python /usr/local/bin/predict_binding.py "$@"
