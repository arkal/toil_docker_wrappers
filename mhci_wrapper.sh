#!/bin/bash
set -e

finish() {
    # Fix ownership of output files
    uid=$(stat -c '%u:%g' /data)
    chown -R $uid /data
}
trap finish EXIT

# Need to set this for the tool to run
export USER='user'

# Call tool with parameters
python /usr/local/bin/predict_binding.py "$@"
