#!/bin/bash
# Call tool with parameters
java $JAVA_OPTS -Djava.io.tmpdir=/data/tmp -jar /opt/pimmuno/mutect/mutect.jar -T MuTect $@

# Fix ownership of output files
UID=$(stat -c '%u:%g' /data)
chown -R $UID /data
