#!/usr/bin/env bash
set -e
args=( "$@" )

# Fix ownership of output files
finish() {
    # Fix ownership of output files
    user_id=$(stat -c '%u:%g' /data)
    chown -R ${user_id} /data
}
trap finish EXIT

if [ "$args" == '-h' ]
then
  echo "This is a wrapper for Strelka. To run Strelka on bams aligned using bwa aln, use the following format"
  echo "docker run -it --rm=true -v <input_folder>:/data aarjunrao/vardict-addons <strelka_config> <tumor_bam> <normal_bam> <reference_fa> [num_cores]"
  echo "NOTE: The arguments have to be in the order mentioned above and all arguments but the number of cores are mandatory."
else
  if [ "$#" -eq 4 ]
  then
    # User provided only tumor, normal, and reference
    strelka_config=$1
    tumor_bam=$2
    normal_bam=$3
    reference_fa=$4
    num_cores=1
  elif [ "$#" -eq 5 ]
  then
    strelka_config=$1
    tumor_bam=$2
    normal_bam=$3
    reference_fa=$4
    num_cores=$5
  else
    echo 'Incorrect number of arguments passed. Run with -h to see the example command line usage.'
    exit 1
  fi

  # configure strelka
  /opt/strelka/bin/configureStrelkaWorkflow.pl \
    --normal=${normal_bam} \
    --tumor=${tumor_bam} \
    --ref=${reference_fa} \
    --config=${strelka_config} \
    --output-dir=/data/strelka_out
  # Run strelka
  make -C /data/strelka_out -j ${num_cores}
fi