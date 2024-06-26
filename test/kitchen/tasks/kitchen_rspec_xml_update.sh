#!/bin/bash

# set testsuite name with the job name
sed -i "s/name=\"rspec\"/name=\"$2\"/g" "$1"
# Edit filepath from relative to the kitchen test to the datadog git repository for codeowners
parent_folder=$(sed -n 's/.*classname="\([^"]*\)_spec.*/\1/p' "$1" | head -1)
sed -i "s/file=\".\/${parent_folder}_spec.rb\"/file=\".\/test\/kitchen\/test\/integration\/${parent_folder}\/rspec_datadog\/${parent_folder}_spec.rb\"/g" "$1"
