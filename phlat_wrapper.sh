#!/bin/bash
set -e

finish() {
    # Fix ownership of output files
    uid=$(stat -c '%u:%g' /data)
    chown -R $uid /data
}
trap finish EXIT

# Call tool with parameters
python -O /home/phlat-1.0/dist/PHLAT.py "$@"
