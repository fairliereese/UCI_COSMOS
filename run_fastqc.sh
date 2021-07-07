#!/bin/bash
#SBATCH --job-name=fastqc       
#SBATCH -p free                  
#SBATCH --nodes=1                
#SBATCH --array=1-2              
#SBATCH --cpus-per-task=1        
#SBATCH --output=fastqc-%J.out   
#SBATCH --error=fastqc-%J.err    

module load fastqc

inpath=/pub/namvn1/COSMO/RNA_Seq/
outpath=/data/homezvol2/erebboah/fshd_rnaseq/

file=prefixes.txt 
inpath=/pub/namvn1/COSMO/RNA_Seq/
sample=`head -n $SLURM_ARRAY_TASK_ID $file | tail -n 1`

fastqc ${inpath}${sample}_R1.fq.gz ${inpath}${sample}_R2.fq.gz -o ${outpath}qc/
