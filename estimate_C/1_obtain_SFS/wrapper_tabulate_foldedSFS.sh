#!/bin/bash

# GS
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do
directory=outputs/obtain_SFS/sfs/cutoff_0.0/GS/autosomes
numInd=4
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/GS/cutoff_${cutoff}_putative.neutral_high.qual_alignable_autosomes_GS_foldedSFS.txt

python tabulate_foldedSFS.py --directory ${directory} --numInd ${numInd} --outfile ${out}
done

# TM
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do
directory=outputs/obtain_SFS/sfs/cutoff_0.0/TM/autosomes
numInd=5
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/TM/cutoff_${cutoff}_putative.neutral_high.qual_alignable_autosomes_TM_foldedSFS.txt

python tabulate_foldedSFS.py --directory ${directory} --numInd ${numInd} --outfile ${out}
done

# BD
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do
directory=outputs/obtain_SFS/sfs/cutoff_0.0/BD/autosomes
numInd=12
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/BD/cutoff_${cutoff}_putative.neutral_high.qual_alignable_autosomes_BD_foldedSFS.txt

python tabulate_foldedSFS.py --directory ${directory} --numInd ${numInd} --outfile ${out}
done

# AW
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do
directory=outputs/obtain_SFS/sfs/cutoff_0.0/AW/autosomes
numInd=6
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/AW/cutoff_${cutoff}_putative.neutral_high.qual_alignable_autosomes_AW_foldedSFS.txt

python tabulate_foldedSFS.py --directory ${directory} --numInd ${numInd} --outfile ${out}
done

# GW
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do
directory=outputs/obtain_SFS/sfs/cutoff_0.0/GW/autosomes
numInd=6
out=outputs/obtain_SFS/sfs/cutoff_${cutoff}/GW/cutoff_${cutoff}_putative.neutral_high.qual_alignable_autosomes_GW_foldedSFS.txt

python tabulate_foldedSFS.py --directory ${directory} --numInd ${numInd} --outfile ${out}
done
