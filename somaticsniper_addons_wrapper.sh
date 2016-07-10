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
  echo "This is a wrapper for the somatic sniper addons. To run a specific tool, use the following format"
  echo "docker run -it --rm=true -v <input_folder>:/data aarjunrao/somaticsniper-addons <tool_name> <tool_args>"
  echo "Tools include:"
  echo "snpfilter.pl"
  echo "prepare_for_readcount.pl"
  echo "highconfidence.pl"
  echo "fpfilter.pl"

else
  if [ "$#" -eq 1 ]
  then
    # User provided only tool name and should get the help for the tool
    perl /usr/local/bin/"$args" --help
  else
    # Call tool with parameters
    perl /usr/local/bin/"$args" "${args[@]:1}"
  fi
fi