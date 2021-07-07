#!/bin/bash
#SBATCH --job-name=fastqc       
#SBATCH -p free                  
#SBATCH --nodes=1                
#SBATCH --array=1-2              
#SBATCH --cpus-per-task=1        
#SBATCH --output=fastqc-%J.out   
#SBATCH --error=fastqc-%J.err    

module load fastqc

input=/pub/namvn1/COSMO/RNA_Seq/
output=/data/homezvol2/erebboah/fshd_rnaseq/

inpath=/pub/namvn1/COSMO/RNA_Seq/
sample=`head -n $SLURM_ARRAY_TASK_ID prefixes.txt  | tail -n 1`

fastqc ${input}${sample}_R1.fq.gz ${input}${sample}_R2.fq.gz -o ${output}qc/
