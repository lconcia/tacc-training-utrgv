#!/bin/bash
#----------------------------------------------------
# Example SLURM job script to run applications on 
# TACCs Frontera system.
#
# Example of job submission
# To submit a batch job, execute:             sbatch example.slurm
# To show all queued jobs from user, execute: showq -u
# To kill a queued job, execute:              scancel <jobId>
#----------------------------------------------------

#SBATCH -J                                 # Job name
#SBATCH -o                                 # Name of stdout output file (%j expands to jobId)
#SBATCH -e                                 # Name of stderr error file (%j expands to jobId)
#SBATCH -p                                 # Queue (partition) name
#SBATCH -N                                 # Total number of nodes (must be 1 for serial)
#SBATCH -n                                 # Total number of threas tasks requested (should be 1 for serial)
#SBATCH -t                                 # Run time (hh:mm:ss), development queue max 2:00:00
#SBATCH --mail-user=your_email@domaim.com  # Address email notifications
#SBATCH --mail-type=all                    # Email at begin and end of job
#SBATCH -A                                 # Project/Allocation name (req'd if you have more than 1)

# Everything below here should be Linux commands
