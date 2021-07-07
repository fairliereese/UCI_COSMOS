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

inpath=/pub/namvn1/COSMO/RNA_Seq/
outpath=/pub/erebboah/cosmos/FSHD_bulkRNA/mapped/

file=prefixes.txt 
sample=`head -n $SLURM_ARRAY_TASK_ID $file | tail -n 1`

index=/pub/erebboah/cosmos/FSHD_bulkRNA/ref/hg38.idx

mkdir ${outpath}${sample}/

kallisto quant -i $index -o $outpath${sample} ${inpath}${sample}_R1.fq.gz ${inpath}${sample}_R2.fq.gz
