#!/bin/bash

###########
# Autosomes
###########

#GS
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38}
do

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/GS/cleaned/chr${i}_GS.GT.FORMAT
numAllele=8
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/GS/autosomes/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_GS_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done
done

#TM
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38}
do

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/TM/cleaned/chr${i}_TM.GT.FORMAT
numAllele=10
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/TM/autosomes/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_TM_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done
done

#BD
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38}
do

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/BD/cleaned/chr${i}_BD.GT.FORMAT
numAllele=24
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/BD/autosomes/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_BD_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done
done

#AW
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38}
do

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/AW/cleaned/chr${i}_AW.GT.FORMAT
numAllele=12
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/AW/autosomes/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_AW_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done
done

#GW
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38}
do

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/GW/cleaned/chr${i}_GW.GT.FORMAT
numAllele=12
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/GW/autosomes/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_GW_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done
done

######
# chrX
######

#GS
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

i=X

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/GS/cleaned/chr${i}_GS.GT.FORMAT
numAllele=8
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/GS/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_GS_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done

#TM
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

i=X

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/TM/cleaned/chr${i}_TM.GT.FORMAT
numAllele=10
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/TM/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_TM_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done

#BD
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

i=X

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/BD/cleaned/chr${i}_BD.GT.FORMAT
numAllele=24
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/BD/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_BD_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done

#AW
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

i=X

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/AW/cleaned/chr${i}_AW.GT.FORMAT
numAllele=12
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/AW/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_AW_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done

#GW
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

i=X

variants=outputs/obtain_SFS/GT/cutoff_${cutoff}/GW/cleaned/chr${i}_GW.GT.FORMAT
numAllele=12
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/GW/cutoff_${cutoff}_putative.neutral_high.qual_alignable_chr${i}_GW_foldedSFS.txt

python generate_foldedSFS.py --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done