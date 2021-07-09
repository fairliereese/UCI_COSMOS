#!/bin/bash
#SBATCH --job-name=kallisto       
#SBATCH -A cosmos2021             
#SBATCH -p standard              
#SBATCH --array=1-8 # controls number of samples              
#SBATCH --nodes=1                 
#SBATCH --cpus-per-task=8        
#SBATCH --output=kallisto-%x%A_%a.o 
#SBATCH --error=kallisto-%x%A_%a.e 

module load kallisto

input=/pub/namvn1/COSMO/RNA_Seq/

output=/data/homezvol1/freese/cosmos/kallisto/

sample=`head -n $SLURM_ARRAY_TASK_ID /data/homezvol1/freese/cosmos/prefixes.txt | tail -n 1`

index=/pub/erebboah/cosmos/FSHD_bulkRNA/ref/hg38.idx

kallisto quant -i $index -o $output${sample} ${input}${sample}_R1.fq.gz ${input}${sample}_R2.fq.gz