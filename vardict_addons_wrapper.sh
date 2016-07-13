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
  echo "This is a wrapper for the vardict addons. To run a specific tool, use the following format"
  echo "docker run -it --rm=true -v <input_folder>:/data aarjunrao/vardict-addons <tool_name> <tool_args>"
  echo "Tools include:"
  echo "teststrandbias.R"
  echo "var2vcf_valid.pl"
  echo "testsomatic.R"
  echo "var2vcf_somatic.pl"
  echo "NOTE: The R scripts DO NOT have help options and TAKE NO ARGUMENTS."
  echo "NOTE: All tools require the input to be piped to them."

else
  if [ "$#" -eq 1 ]
  then
    # User provided only tool name and should get the help for the tool
    /opt/VarDictJava/VarDict/"$args" -h
  else
    # Call tool with parameters
    /opt/VarDictJava/VarDict/"$args" "${args[@]:1}"
  fi
fi
