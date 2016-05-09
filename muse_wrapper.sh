#!/bin/bash
set -e

finish() {
    # Fix ownership of output files
    uid=$(stat -c '%u:%g' /data)
    chown -R $uid /data
}
trap finish EXIT

# Call tool with parameters
/usr/local/bin/MuSEv1.0rc_submission_b391201a "$@" 
