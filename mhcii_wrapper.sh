#!/bin/bash
set -e

finish() {
    # Fix ownership of output files
    UID=$(stat -c '%u:%g' /data)
    chown -R $UID /data
}
trap finish EXIT

# Call tool with parameters
python /usr/local/bin/mhc_II_binding.py "$@"
