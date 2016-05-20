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
  echo "This is a wrapper for the vcftools suite. To run a specific tool, use the following format"
  echo "docker run -it --rm=true -v <input_folder>:/data aarjunrao/vcftools <tool_name> <tool_args>"
  echo "Tools include:"
  echo "vcftools"
  echo "fill-aa"
  echo "fill-an-ac"
  echo "fill-fs"
  echo "fill-ref-md5"
  echo "fill-rsIDs"
  echo "vcf-annotate"
  echo "vcf-compare"
  echo "vcf-concat"
  echo "vcf-consensus"
  echo "vcf-contrast"
  echo "vcf-convert"
  echo "vcf-filter"
  echo "vcf-fix-newlines"
  echo "vcf-fix-ploidy"
  echo "vcf-indel-stats"
  echo "vcf-isec"
  echo "vcf-merge"
  echo "vcf-phased-join"
  echo "vcf-query"
  echo "vcf-shuffle-cols"
  echo "vcf-sort"
  echo "vcf-stats"
  echo "vcf-subset"
  echo "vcf-to-tab"
  echo "vcf-tstv"
  echo "vcf-validator"
  
else
  if [ "$#" -eq 1 ]
  then
    # User provided only tool name and should get the help for the tool
    /usr/local/bin/"$args" --help
  else
    # Call tool with parameters
    /usr/local/bin/"$args" "${args[@]:1}"
  fi
fi