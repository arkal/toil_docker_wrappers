#!/bin/bash
set -e
args=( "$@" )

finish() {
    # Fix ownership of output files
    uid=$(stat -c '%u:%g' /data)
    chown -R $uid /data
}
trap finish EXIT

if [ "$args" == '-h' ]
then
  echo "This is a wrapper for the bedtools2 suite. To run a specific tool, use the following format"
  echo "docker run -it --rm=true -v <input_folder>:/data aarjunrao/bedtools2 <tool_name> <tool_args>"
  echo "Tools include:"
  echo "annotateBed"
  echo "bedToIgv"
  echo "complementBed"
  echo "genomeCoverageBed"
  echo "mapBed"
  echo "nucBed"
  echo "shuffleBed"
  echo "unionBedGraphs"
  echo "bamToBed"
  echo "bedpeToBam"
  echo "coverageBed"
  echo "getOverlap"
  echo "maskFastaFromBed"
  echo "pairToBed"
  echo "slopBed"
  echo "windowBed"
  echo "bamToFastq"
  echo "bedtools"
  echo "expandCols"
  echo "groupBy"
  echo "mergeBed"
  echo "pairToPair"
  echo "sortBed"
  echo "windowMaker"
  echo "bed12ToBed6"
  echo "closestBed"
  echo "fastaFromBed"
  echo "intersectBed"
  echo "multiBamCov"
  echo "randomBed"
  echo "subtractBed"
  echo "bedToBam"
  echo "clusterBed"
  echo "flankBed"
  echo "linksBed"
  echo "multiIntersectBed"
  echo "shiftBed"
  echo "tagBam"

  
else
  if [ $# -eq 1 ]
  then
    # User provided only tool name and should get the help for the tool
    /usr/local/bin/"$args" -h
  else
    # Call tool with parameters
    /usr/local/bin/"$args" "${args[@]:1}"
  fi
fi