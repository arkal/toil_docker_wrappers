#!/bin/bash
# Call tool with parameters
java $JAVA_OPTS -jar /opt/pimmuno/mutect/muTect-1.1.4.jar $@

# Fix ownership of output files
UID=$(stat -c '%u:%g' /data)
chown -R $UID /data
