#!/bin/bash
# Call tool with parameters
java $JAVA_OPTS -Djava.io.tmpdir=/data/tmp -jar /opt/pimmuno/picard/picard.jar $@

# Fix ownership of output files
UID=$(stat -c '%u:%g' /data)
chown -R $UID /data
