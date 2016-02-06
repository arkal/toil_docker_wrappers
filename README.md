# toil_docker_wrappers


This repo contains the individual docker wrapper scripts for the various tools
in the precision immuno pipeline. Each tool will do the following
1. Set the wrapper script to exit immediately on any error
2. Run the tool with the provided arguments
3. Change the permissions of the files in /data to be the same as those
   of it's parent. 

This way, all files created within the image are fully modifiable by the 
owner of the parent directory within which /data is mounted.
