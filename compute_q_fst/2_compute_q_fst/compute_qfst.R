# This script compute QFST where FST is obtained from Weir and Cockerham formula that is implemented in SNPRelate

# Usage: Rscript compute_qfst.R 
# input 1: path to the autosomes fst values.cutoff_0.0_GS_TM_autosomes_fst.txt
# input 2: path to the chrX fst values
# input 3: name of the pair. For example: GS-TM
# input 4: path to the output

input <- commandArgs(trailingOnly=T)

autosomes = read.table(input[1])
chrX = read.table(input[2])

fst_A = autosomes[,3]
fst_X = chrX[,3]

qfst = log(1-2*fst_A)/log(1-2*fst_X)

to_print = data.frame(input[3], qfst)

write.table(to_print, input[4], quote = FALSE, row.names = FALSE, col.names = FALSE, append = TRUE)