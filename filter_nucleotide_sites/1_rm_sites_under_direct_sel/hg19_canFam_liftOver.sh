#!/bin/bash

# NOTES: before running, make sure to input where the directory "download" is.

oldfile=download/phastConsEl/hg19_phastConsEl.bed
chain=download/phastConsEl/hg19ToCanFam3.over.chain
newfile=download/phastConsEl/canFam_phastConsEl.bed
unmap=download/phastConsEl/hg19_canFam_phastConsEl_liftOver_unmapped.bed

./liftOver ${oldfile} ${chain} ${newfile} ${unmap}
