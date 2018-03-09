library(gdsfmt)
library(SNPRelate)

# Usage: Rscript fst_snprelate.R 
# input 1: /path/to/the/unzipped/vcf/file/ 
# input 2: /path/to/the/genofile/ 
# input 3: /path/to/the/population/information/file/ 
# input 4: /name/of/population/1/ 
# input 5: /name/of/population/2/ 
# input 6: /name/of/pair/
# input 7: name of the region (chrX or autosomes)
# input 8: /name/of/outfile/

input <- commandArgs(trailingOnly=T)

# Input the VCF file
vcf = input[1]

# Reformat
snpgdsVCF2GDS(vcf, input[2], method="biallelic.only")

# Summary
snpgdsSummary(input[2])

# Open the GDS file
genofile = snpgdsOpen(input[2])

# Get sample id
sample.id = read.gdsn(index.gdsn(genofile, "sample.id"))

# Get populatoin information
pop_code = scan(input[3], what=character())

# Two populations: GS and TM
flag = pop_code %in% c(input[4], input[5])
samp.sel = sample.id[flag]
pop.sel = pop_code[flag]
fst = snpgdsFst(genofile, sample.id=samp.sel, population=as.factor(pop.sel),
          method="W&C84", autosome.only=FALSE)

out=data.frame(input[6], input[7], fst$Fst)

write.table(out, input[8], quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")

# close the genotype file
snpgdsClose(genofile)