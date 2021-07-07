#!/bin/bash
#SBATCH --job-name=kallisto       
#SBATCH -A cosmos2021             
#SBATCH -p standard              
#SBATCH --array=1-8              
#SBATCH --nodes=1                 
#SBATCH --cpus-per-task=8        
#SBATCH --output=kallisto-%J.out 
#SBATCH --error=kallisto-%J.err 

module load kallisto

input=/pub/namvn1/COSMO/RNA_Seq/
output=/pub/erebboah/cosmos/FSHD_bulkRNA/mapped/
sample=`head -n $SLURM_ARRAY_TASK_ID prefixes.txt | tail -n 1`

index=/pub/erebboah/cosmos/FSHD_bulkRNA/ref/hg38.idx

mkdir ${output}${sample}/

kallisto quant -i $index -o $output${sample} ${input}${sample}_R1.fq.gz ${input}${sample}_R2.fq.gz
