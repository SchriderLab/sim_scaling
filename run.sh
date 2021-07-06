#!/bin/bash

#SBATCH -t 3:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=amjad_dabi@unc.edu
#SBATCH --array=1-100
#SBATCH --output=slurm_out.out
#SBATCH --error=slurm_err.out

slim -d log_dir="\"/pine/scr/a/m/amjada/eff_sim\"" -d job_no=$SLURM_ARRAY_TASK_ID -d pop_size=$1 -d run_time=$2 metrics.slim
