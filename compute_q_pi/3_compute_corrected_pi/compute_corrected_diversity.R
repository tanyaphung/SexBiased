################################################################################################################
# Compute corrected diversity on the X chromosome, autosomes, and X/A ratio
################################################################################################################
setwd("outputs") #change working directory here

###############
## X CHROMOSOME
###############

GW_X_0.0 = read.table("compute_diversity/cutoff_0.0/GW/GW_chrX_diversity_cutoff_0.0.txt")
colnames(GW_X_0.0) = c("start", "end", "num", "GW_pi")

GW_X_0.2 = read.table("compute_diversity/cutoff_0.2/GW/GW_chrX_diversity_cutoff_0.2.txt")
colnames(GW_X_0.2) = c("start", "end", "num", "GW_pi")

GW_X_0.4 = read.table("compute_diversity/cutoff_0.4/GW/GW_chrX_diversity_cutoff_0.4.txt")
colnames(GW_X_0.4) = c("start", "end", "num", "GW_pi")

GW_X_0.6 = read.table("compute_diversity/cutoff_0.6/GW/GW_chrX_diversity_cutoff_0.6.txt")
colnames(GW_X_0.6) = c("start", "end", "num", "GW_pi")

GW_X_0.8 = read.table("compute_diversity/cutoff_0.8/GW/GW_chrX_diversity_cutoff_0.8.txt")
colnames(GW_X_0.8) = c("start", "end", "num", "GW_pi")

GW_X_1.0 = read.table("compute_diversity/cutoff_1.0/GW/GW_chrX_diversity_cutoff_1.0.txt")
colnames(GW_X_1.0) = c("start", "end", "num", "GW_pi")

# Remove PAR
GW_X_0.0_rmPAR = subset(GW_X_0.0, GW_X_0.0$start > 6590000)
GW_X_0.2_rmPAR = subset(GW_X_0.2, GW_X_0.2$start > 6590000)
GW_X_0.4_rmPAR = subset(GW_X_0.4, GW_X_0.4$start > 6590000)
GW_X_0.6_rmPAR = subset(GW_X_0.6, GW_X_0.6$start > 6590000)
GW_X_0.8_rmPAR = subset(GW_X_0.8, GW_X_0.8$start > 6590000)
GW_X_1.0_rmPAR = subset(GW_X_1.0, GW_X_1.0$start > 6590000)

# Compute pi per site
GW_X_0.0_pipersite = sum(GW_X_0.0_rmPAR$GW_pi)/sum(GW_X_0.0_rmPAR$num)
GW_X_0.2_pipersite = sum(GW_X_0.2_rmPAR$GW_pi)/sum(GW_X_0.2_rmPAR$num)
GW_X_0.4_pipersite = sum(GW_X_0.4_rmPAR$GW_pi)/sum(GW_X_0.4_rmPAR$num)
GW_X_0.6_pipersite = sum(GW_X_0.6_rmPAR$GW_pi)/sum(GW_X_0.6_rmPAR$num)
GW_X_0.8_pipersite = sum(GW_X_0.8_rmPAR$GW_pi)/sum(GW_X_0.8_rmPAR$num)
GW_X_1.0_pipersite = sum(GW_X_1.0_rmPAR$GW_pi)/sum(GW_X_1.0_rmPAR$num)

print (paste("GW chrX uncorrected diversity at cutoff 0.0 is", GW_X_0.0_pipersite, sep=" "))
print (paste("GW chrX uncorrected diversity at cutoff 0.2 is", GW_X_0.2_pipersite, sep=" "))
print (paste("GW chrX uncorrected diversity at cutoff 0.4 is", GW_X_0.4_pipersite, sep=" "))
print (paste("GW chrX uncorrected diversity at cutoff 0.6 is", GW_X_0.6_pipersite, sep=" "))
print (paste("GW chrX uncorrected diversity at cutoff 0.8 is", GW_X_0.8_pipersite, sep=" "))
print (paste("GW chrX uncorrected diversity at cutoff 1.0 is", GW_X_1.0_pipersite, sep=" "))


# Load dog-cat divergence file
X_dog_cat_div_0.0 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.0/chrX_dog_cat_divergence_cutoff_0.0_clean.txt")
colnames(X_dog_cat_div_0.0) = c("start", "end", "num_sites", "num_callable", "num_divergence")

X_dog_cat_div_0.2 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.2/chrX_dog_cat_divergence_cutoff_0.2_clean.txt")
colnames(X_dog_cat_div_0.2) = c("start", "end", "num_sites", "num_callable", "num_divergence")

X_dog_cat_div_0.4 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.4/chrX_dog_cat_divergence_cutoff_0.4_clean.txt")
colnames(X_dog_cat_div_0.4) = c("start", "end", "num_sites", "num_callable", "num_divergence")

X_dog_cat_div_0.6 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.6/chrX_dog_cat_divergence_cutoff_0.6_clean.txt")
colnames(X_dog_cat_div_0.6) = c("start", "end", "num_sites", "num_callable", "num_divergence")

X_dog_cat_div_0.8 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.8/chrX_dog_cat_divergence_cutoff_0.8_clean.txt")
colnames(X_dog_cat_div_0.8) = c("start", "end", "num_sites", "num_callable", "num_divergence")

X_dog_cat_div_1.0 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_1.0/chrX_dog_cat_divergence_cutoff_1.0_clean.txt")
colnames(X_dog_cat_div_1.0) = c("start", "end", "num_sites", "num_callable", "num_divergence")

# Remove PAR in dog-cat divergence file
X_dog_cat_div_0.0_rmPAR = subset(X_dog_cat_div_0.0, X_dog_cat_div_0.0$start > 6590000)
X_dog_cat_div_0.2_rmPAR = subset(X_dog_cat_div_0.2, X_dog_cat_div_0.2$start > 6590000)
X_dog_cat_div_0.4_rmPAR = subset(X_dog_cat_div_0.4, X_dog_cat_div_0.4$start > 6590000)
X_dog_cat_div_0.6_rmPAR = subset(X_dog_cat_div_0.6, X_dog_cat_div_0.6$start > 6590000)
X_dog_cat_div_0.8_rmPAR = subset(X_dog_cat_div_0.8, X_dog_cat_div_0.8$start > 6590000)
X_dog_cat_div_1.0_rmPAR = subset(X_dog_cat_div_1.0, X_dog_cat_div_1.0$start > 6590000)

# Compute dog-cat divergence per site
X_dog_cat_div_0.0_persite = sum(as.numeric(X_dog_cat_div_0.0_rmPAR$num_divergence))/sum(as.numeric(X_dog_cat_div_0.0_rmPAR$num_callable))
X_dog_cat_div_0.2_persite = sum(as.numeric(X_dog_cat_div_0.2_rmPAR$num_divergence))/sum(as.numeric(X_dog_cat_div_0.2_rmPAR$num_callable))
X_dog_cat_div_0.4_persite = sum(as.numeric(X_dog_cat_div_0.4_rmPAR$num_divergence))/sum(as.numeric(X_dog_cat_div_0.4_rmPAR$num_callable))
X_dog_cat_div_0.6_persite = sum(as.numeric(X_dog_cat_div_0.6_rmPAR$num_divergence))/sum(as.numeric(X_dog_cat_div_0.6_rmPAR$num_callable))
X_dog_cat_div_0.8_persite = sum(as.numeric(X_dog_cat_div_0.8_rmPAR$num_divergence))/sum(as.numeric(X_dog_cat_div_0.8_rmPAR$num_callable))
X_dog_cat_div_1.0_persite = sum(as.numeric(X_dog_cat_div_1.0_rmPAR$num_divergence))/sum(as.numeric(X_dog_cat_div_1.0_rmPAR$num_callable))

print (paste("GW chrX dog-cat divergence at cutoff 0.0 is", X_dog_cat_div_0.0_persite, sep=" "))
print (paste("GW chrX dog-cat divergence at cutoff 0.2 is", X_dog_cat_div_0.2_persite, sep=" "))
print (paste("GW chrX dog-cat divergence at cutoff 0.4 is", X_dog_cat_div_0.4_persite, sep=" "))
print (paste("GW chrX dog-cat divergence at cutoff 0.6 is", X_dog_cat_div_0.6_persite, sep=" "))
print (paste("GW chrX dog-cat divergence at cutoff 0.8 is", X_dog_cat_div_0.8_persite, sep=" "))
print (paste("GW chrX dog-cat divergence at cutoff 1.0 is", X_dog_cat_div_1.0_persite, sep=" "))

# Normalize pi with divergence
GW_X_0.0_pipersite_normed = GW_X_0.0_pipersite/X_dog_cat_div_0.0_persite
GW_X_0.2_pipersite_normed = GW_X_0.2_pipersite/X_dog_cat_div_0.2_persite
GW_X_0.4_pipersite_normed = GW_X_0.4_pipersite/X_dog_cat_div_0.4_persite
GW_X_0.6_pipersite_normed = GW_X_0.6_pipersite/X_dog_cat_div_0.6_persite
GW_X_0.8_pipersite_normed = GW_X_0.8_pipersite/X_dog_cat_div_0.8_persite
GW_X_1.0_pipersite_normed = GW_X_1.0_pipersite/X_dog_cat_div_1.0_persite

print (paste("GW chrX corrected diversity at cutoff 0.0 is", GW_X_0.0_pipersite_normed, sep=" "))
print (paste("GW chrX corrected diversity at cutoff 0.2 is", GW_X_0.2_pipersite_normed, sep=" "))
print (paste("GW chrX corrected diversity at cutoff 0.4 is", GW_X_0.4_pipersite_normed, sep=" "))
print (paste("GW chrX corrected diversity at cutoff 0.6 is", GW_X_0.6_pipersite_normed, sep=" "))
print (paste("GW chrX corrected diversity at cutoff 0.8 is", GW_X_0.8_pipersite_normed, sep=" "))
print (paste("GW chrX corrected diversity at cutoff 1.0 is", GW_X_1.0_pipersite_normed, sep=" "))


###############
## AUTOSOMES
###############

GW_A_0.0 = read.table("compute_diversity/cutoff_0.0/GW/GW_autosomes_diversity_cutoff_0.0.txt")
colnames(GW_A_0.0) = c("start", "end", "num", "GW_pi")

GW_A_0.2 = read.table("compute_diversity/cutoff_0.2/GW/GW_autosomes_diversity_cutoff_0.2.txt")
colnames(GW_A_0.2) = c("start", "end", "num", "GW_pi")

GW_A_0.4 = read.table("compute_diversity/cutoff_0.4/GW/GW_autosomes_diversity_cutoff_0.4.txt")
colnames(GW_A_0.4) = c("start", "end", "num", "GW_pi")

GW_A_0.6 = read.table("compute_diversity/cutoff_0.6/GW/GW_autosomes_diversity_cutoff_0.6.txt")
colnames(GW_A_0.6) = c("start", "end", "num", "GW_pi")

GW_A_0.8 = read.table("compute_diversity/cutoff_0.8/GW/GW_autosomes_diversity_cutoff_0.8.txt")
colnames(GW_A_0.8) = c("start", "end", "num", "GW_pi")

GW_A_1.0 = read.table("compute_diversity/cutoff_1.0/GW/GW_autosomes_diversity_cutoff_1.0.txt")
colnames(GW_A_1.0) = c("start", "end", "num", "GW_pi")

# Compute pi per site
GW_A_0.0_pipersite = sum(GW_A_0.0$GW_pi)/sum(GW_A_0.0$num)
GW_A_0.2_pipersite = sum(GW_A_0.2$GW_pi)/sum(GW_A_0.2$num)
GW_A_0.4_pipersite = sum(GW_A_0.4$GW_pi)/sum(GW_A_0.4$num)
GW_A_0.6_pipersite = sum(GW_A_0.6$GW_pi)/sum(GW_A_0.6$num)
GW_A_0.8_pipersite = sum(GW_A_0.8$GW_pi)/sum(GW_A_0.8$num)
GW_A_1.0_pipersite = sum(GW_A_1.0$GW_pi)/sum(GW_A_1.0$num)

print (paste("GW autosomes uncorrected diversity at cutoff 0.0 is", GW_A_0.0_pipersite, sep=" "))
print (paste("GW autosomes uncorrected diversity at cutoff 0.2 is", GW_A_0.2_pipersite, sep=" "))
print (paste("GW autosomes uncorrected diversity at cutoff 0.4 is", GW_A_0.4_pipersite, sep=" "))
print (paste("GW autosomes uncorrected diversity at cutoff 0.6 is", GW_A_0.6_pipersite, sep=" "))
print (paste("GW autosomes uncorrected diversity at cutoff 0.8 is", GW_A_0.8_pipersite, sep=" "))
print (paste("GW autosomes uncorrected diversity at cutoff 1.0 is", GW_A_1.0_pipersite, sep=" "))

# Load dog-cat divergence file
A_dog_cat_div_0.0 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.0/autosomes_dog_cat_divergence_cutoff_0.0_clean.txt")
colnames(A_dog_cat_div_0.0) = c("start", "end", "num_sites", "num_callable", "num_divergence")

A_dog_cat_div_0.2 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.2/autosomes_dog_cat_divergence_cutoff_0.2_clean.txt")
colnames(A_dog_cat_div_0.2) = c("start", "end", "num_sites", "num_callable", "num_divergence")

A_dog_cat_div_0.4 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.4/autosomes_dog_cat_divergence_cutoff_0.4_clean.txt")
colnames(A_dog_cat_div_0.4) = c("start", "end", "num_sites", "num_callable", "num_divergence")

A_dog_cat_div_0.6 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.6/autosomes_dog_cat_divergence_cutoff_0.6_clean.txt")
colnames(A_dog_cat_div_0.6) = c("start", "end", "num_sites", "num_callable", "num_divergence")

A_dog_cat_div_0.8 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.8/autosomes_dog_cat_divergence_cutoff_0.8_clean.txt")
colnames(A_dog_cat_div_0.8) = c("start", "end", "num_sites", "num_callable", "num_divergence")

A_dog_cat_div_1.0 = read.table("compute_dog_cat_divergence/dog_cat_divergence/cutoff_1.0/autosomes_dog_cat_divergence_cutoff_1.0_clean.txt")
colnames(A_dog_cat_div_1.0) = c("start", "end", "num_sites", "num_callable", "num_divergence")

# Compute dog-cat divergence per site
A_dog_cat_div_0.0_persite = sum(A_dog_cat_div_0.0$num_divergence)/sum(A_dog_cat_div_0.0$num_callable)
A_dog_cat_div_0.2_persite = sum(A_dog_cat_div_0.2$num_divergence)/sum(A_dog_cat_div_0.2$num_callable)
A_dog_cat_div_0.4_persite = sum(A_dog_cat_div_0.4$num_divergence)/sum(A_dog_cat_div_0.4$num_callable)
A_dog_cat_div_0.6_persite = sum(A_dog_cat_div_0.6$num_divergence)/sum(A_dog_cat_div_0.6$num_callable)
A_dog_cat_div_0.8_persite = sum(A_dog_cat_div_0.8$num_divergence)/sum(A_dog_cat_div_0.8$num_callable)
A_dog_cat_div_1.0_persite = sum(A_dog_cat_div_1.0$num_divergence)/sum(A_dog_cat_div_1.0$num_callable)

print (paste("GW autosomes dog-cat divergence at cutoff 0.0 is", A_dog_cat_div_0.0_persite, sep=" "))
print (paste("GW autosomes dog-cat divergence at cutoff 0.2 is", A_dog_cat_div_0.2_persite, sep=" "))
print (paste("GW autosomes dog-cat divergence at cutoff 0.4 is", A_dog_cat_div_0.4_persite, sep=" "))
print (paste("GW autosomes dog-cat divergence at cutoff 0.6 is", A_dog_cat_div_0.6_persite, sep=" "))
print (paste("GW autosomes dog-cat divergence at cutoff 0.8 is", A_dog_cat_div_0.8_persite, sep=" "))
print (paste("GW autosomes dog-cat divergence at cutoff 1.0 is", A_dog_cat_div_1.0_persite, sep=" "))

# Normalize pi with divergence
GW_A_0.0_pipersite_normed = GW_A_0.0_pipersite/A_dog_cat_div_0.0_persite
GW_A_0.2_pipersite_normed = GW_A_0.2_pipersite/A_dog_cat_div_0.2_persite
GW_A_0.4_pipersite_normed = GW_A_0.4_pipersite/A_dog_cat_div_0.4_persite
GW_A_0.6_pipersite_normed = GW_A_0.6_pipersite/A_dog_cat_div_0.6_persite
GW_A_0.8_pipersite_normed = GW_A_0.8_pipersite/A_dog_cat_div_0.8_persite
GW_A_1.0_pipersite_normed = GW_A_1.0_pipersite/A_dog_cat_div_1.0_persite

print (paste("GW autosomes corrected diversity at cutoff 0.0 is", GW_A_0.0_pipersite_normed, sep=" "))
print (paste("GW autosomes corrected diversity at cutoff 0.2 is", GW_A_0.2_pipersite_normed, sep=" "))
print (paste("GW autosomes corrected diversity at cutoff 0.4 is", GW_A_0.4_pipersite_normed, sep=" "))
print (paste("GW autosomes corrected diversity at cutoff 0.6 is", GW_A_0.6_pipersite_normed, sep=" "))
print (paste("GW autosomes corrected diversity at cutoff 0.8 is", GW_A_0.8_pipersite_normed, sep=" "))
print (paste("GW autosomes corrected diversity at cutoff 1.0 is", GW_A_1.0_pipersite_normed, sep=" "))

###################
# COMPUTE X/A RATIO
###################
GW_0.0_ratio = GW_X_0.0_pipersite/GW_A_0.0_pipersite
GW_0.2_ratio = GW_X_0.2_pipersite/GW_A_0.2_pipersite
GW_0.4_ratio = GW_X_0.4_pipersite/GW_A_0.4_pipersite
GW_0.6_ratio = GW_X_0.6_pipersite/GW_A_0.6_pipersite
GW_0.8_ratio = GW_X_0.8_pipersite/GW_A_0.8_pipersite
GW_1.0_ratio = GW_X_1.0_pipersite/GW_A_1.0_pipersite

print (paste("GW X/A uncorrected at cutoff 0.0 is", GW_0.0_ratio, sep=" "))
print (paste("GW X/A uncorrected at cutoff 0.2 is", GW_0.2_ratio, sep=" "))
print (paste("GW X/A uncorrected at cutoff 0.4 is", GW_0.4_ratio, sep=" "))
print (paste("GW X/A uncorrected at cutoff 0.6 is", GW_0.6_ratio, sep=" "))
print (paste("GW X/A uncorrected at cutoff 0.8 is", GW_0.8_ratio, sep=" "))
print (paste("GW X/A uncorrected at cutoff 1.0 is", GW_1.0_ratio, sep=" "))

GW_0.0_ratio_normed = GW_X_0.0_pipersite_normed/GW_A_0.0_pipersite_normed
GW_0.2_ratio_normed = GW_X_0.2_pipersite_normed/GW_A_0.2_pipersite_normed
GW_0.4_ratio_normed = GW_X_0.4_pipersite_normed/GW_A_0.4_pipersite_normed
GW_0.6_ratio_normed = GW_X_0.6_pipersite_normed/GW_A_0.6_pipersite_normed
GW_0.8_ratio_normed = GW_X_0.8_pipersite_normed/GW_A_0.8_pipersite_normed
GW_1.0_ratio_normed = GW_X_1.0_pipersite_normed/GW_A_1.0_pipersite_normed

print (paste("GW X/A corrected at cutoff 0.0 is", GW_0.0_ratio_normed, sep=" "))
print (paste("GW X/A corrected at cutoff 0.2 is", GW_0.2_ratio_normed, sep=" "))
print (paste("GW X/A corrected at cutoff 0.4 is", GW_0.4_ratio_normed, sep=" "))
print (paste("GW X/A corrected at cutoff 0.6 is", GW_0.6_ratio_normed, sep=" "))
print (paste("GW X/A corrected at cutoff 0.8 is", GW_0.8_ratio_normed, sep=" "))
print (paste("GW X/A corrected at cutoff 1.0 is", GW_1.0_ratio_normed, sep=" "))