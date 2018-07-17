#!/bin/bash

# Project build script
# Fetched binaries after building them on a remote machine
# NB This is meant to to be run in c9
# DO NOT RUN THIS SCRIPT ON THE LAB MACHINES

temp_dir=".TempyTempTemp"

build() {
# First, remote into the lab machine
ssh ${user}@ugls.ece.uvic.ca bash -c "'

# Clone the repository to temp location
git clone https://github.com/JoshuaPortelance/SENG-440-Spring2018 ${temp_dir}

# Build the binaries (ignore failures)
cd ${temp_dir}/functional_C_code/floating_point_solution
make
cd ../fixed_point_solution
make
'"

# Copy binaries back to the workspace (ignore files not present)
scp ${user}@ugls.ece.uvic.ca:/home/${user}/${temp_dir}/functional_C_code/floating_point_solution/*.exe functional_C_code/floating_point_solution/
scp ${user}@ugls.ece.uvic.ca:/home/${user}/${temp_dir}/functional_C_code/fixed_point_solution/*.exe functional_C_code/fixed_point_solution/

# Destroy temporary repo on lab machine
ssh ${user}@ugls.ece.uvic.ca bash -c "'
rm -fr ${temp_dir}
'"

}

# Main control sequence
while [[ $# -gt 0 ]]; do
  opt="$1"
  shift;
  current_arg="$1"
  case "$opt" in
    "-u"|"--user" 	) user="$1"; build; shift;;
    *                   ) echo "ERROR: Invalid option: \""$opt"\"" >&2
                          exit 1;;
  esac
done
