# Calculate mutation rate from divergence (d = 2*mu*t)

##################################################################
# Write function to compute mutation rate
# Mutation rate is a function of divergence (d) and split time (t)
##################################################################

mu = function(d, t) {
  mu = d/(2*t)
  return (mu)
}

######################### END writing functions #########################

###############################################################################################################
# Divergence is calculated from regions in the genome that are:
# 1. outside of genes, outside of conserved regions, far away from genes as defined by multiple thresholds
# 2. high in quality from whole genome sequencing
# 3. alignable between dog and cat
###############################################################################################################
# Load data
cutoff_0.0_X = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.0/chrX_dog_cat_divergence_cutoff_0.0_clean.txt")
cutoff_0.0_A = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.0/autosomes_dog_cat_divergence_cutoff_0.0_clean.txt")

cutoff_0.2_X = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.2/chrX_dog_cat_divergence_cutoff_0.2_clean.txt")
cutoff_0.2_A = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.2/autosomes_dog_cat_divergence_cutoff_0.2_clean.txt")

cutoff_0.4_X = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.4/chrX_dog_cat_divergence_cutoff_0.4_clean.txt")
cutoff_0.4_A = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.4/autosomes_dog_cat_divergence_cutoff_0.4_clean.txt")

cutoff_0.6_X = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.6/chrX_dog_cat_divergence_cutoff_0.6_clean.txt")
cutoff_0.6_A = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.6/autosomes_dog_cat_divergence_cutoff_0.6_clean.txt")

cutoff_0.8_X = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.8/chrX_dog_cat_divergence_cutoff_0.8_clean.txt")
cutoff_0.8_A = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.8/autosomes_dog_cat_divergence_cutoff_0.8_clean.txt")

cutoff_1.0_X = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_1.0/chrX_dog_cat_divergence_cutoff_1.0_clean.txt")
cutoff_1.0_A = read.table("outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_1.0/autosomes_dog_cat_divergence_cutoff_1.0_clean.txt")

# Add header

colnames(cutoff_0.0_X) = c("start", "end", "num_sites", "num_callable", "num_divergence")
colnames(cutoff_0.0_A) = c("start", "end", "num_sites", "num_callable", "num_divergence")

colnames(cutoff_0.2_X) = c("start", "end", "num_sites", "num_callable", "num_divergence")
colnames(cutoff_0.2_A) = c("start", "end", "num_sites", "num_callable", "num_divergence")

colnames(cutoff_0.4_X) = c("start", "end", "num_sites", "num_callable", "num_divergence")
colnames(cutoff_0.4_A) = c("start", "end", "num_sites", "num_callable", "num_divergence")

colnames(cutoff_0.6_X) = c("start", "end", "num_sites", "num_callable", "num_divergence")
colnames(cutoff_0.6_A) = c("start", "end", "num_sites", "num_callable", "num_divergence")

colnames(cutoff_0.8_X) = c("start", "end", "num_sites", "num_callable", "num_divergence")
colnames(cutoff_0.8_A) = c("start", "end", "num_sites", "num_callable", "num_divergence")

colnames(cutoff_1.0_X) = c("start", "end", "num_sites", "num_callable", "num_divergence")
colnames(cutoff_1.0_A) = c("start", "end", "num_sites", "num_callable", "num_divergence")

# Remove PAR from the X chromsome
cutoff_0.0_X_rmPAR = subset(cutoff_0.0_X, cutoff_0.0_X$start > 6590000)
cutoff_0.2_X_rmPAR = subset(cutoff_0.2_X, cutoff_0.2_X$start > 6590000)
cutoff_0.4_X_rmPAR = subset(cutoff_0.4_X, cutoff_0.4_X$start > 6590000)
cutoff_0.6_X_rmPAR = subset(cutoff_0.6_X, cutoff_0.6_X$start > 6590000)
cutoff_0.8_X_rmPAR = subset(cutoff_0.8_X, cutoff_0.8_X$start > 6590000)
cutoff_1.0_X_rmPAR = subset(cutoff_1.0_X, cutoff_1.0_X$start > 6590000)

# Compute divergence
cutoff_0.0_X_div = sum(cutoff_0.0_X_rmPAR$num_divergence)/sum(cutoff_0.0_X_rmPAR$num_callable)
cutoff_0.0_A_div = sum(cutoff_0.0_A$num_divergence)/sum(cutoff_0.0_A$num_callable)

cutoff_0.2_X_div = sum(cutoff_0.2_X_rmPAR$num_divergence)/sum(cutoff_0.2_X_rmPAR$num_callable)
cutoff_0.2_A_div = sum(cutoff_0.2_A$num_divergence)/sum(cutoff_0.2_A$num_callable)

cutoff_0.4_X_div = sum(cutoff_0.4_X_rmPAR$num_divergence)/sum(cutoff_0.4_X_rmPAR$num_callable)
cutoff_0.4_A_div = sum(cutoff_0.4_A$num_divergence)/sum(cutoff_0.4_A$num_callable)

cutoff_0.6_X_div = sum(cutoff_0.6_X_rmPAR$num_divergence)/sum(cutoff_0.6_X_rmPAR$num_callable)
cutoff_0.6_A_div = sum(cutoff_0.6_A$num_divergence)/sum(cutoff_0.6_A$num_callable)

cutoff_0.8_X_div = sum(cutoff_0.8_X_rmPAR$num_divergence)/sum(cutoff_0.8_X_rmPAR$num_callable)
cutoff_0.8_A_div = sum(cutoff_0.8_A$num_divergence)/sum(cutoff_0.8_A$num_callable)

cutoff_1.0_X_div = sum(cutoff_1.0_X_rmPAR$num_divergence)/sum(cutoff_1.0_X_rmPAR$num_callable)
cutoff_1.0_A_div = sum(cutoff_1.0_A$num_divergence)/sum(cutoff_1.0_A$num_callable)

# Compute mutation rate
# Use 1 year/generation
freedman_X_mu = mu(freedman_X_div, 54000000)
freedman_A_mu = mu(freedman_A_div, 54000000)

cutoff_0.0_X_mu = mu(cutoff_0.0_X_div, 54000000)
cutoff_0.0_A_mu = mu(cutoff_0.0_A_div, 54000000)

cutoff_0.2_X_mu = mu(cutoff_0.2_X_div, 54000000)
cutoff_0.2_A_mu = mu(cutoff_0.2_A_div, 54000000)

cutoff_0.4_X_mu = mu(cutoff_0.4_X_div, 54000000)
cutoff_0.4_A_mu = mu(cutoff_0.4_A_div, 54000000)

cutoff_0.6_X_mu = mu(cutoff_0.6_X_div, 54000000)
cutoff_0.6_A_mu = mu(cutoff_0.6_A_div, 54000000)

cutoff_0.8_X_mu = mu(cutoff_0.8_X_div, 54000000)
cutoff_0.8_A_mu = mu(cutoff_0.8_A_div, 54000000)

cutoff_1.0_X_mu = mu(cutoff_1.0_X_div, 54000000)
cutoff_1.0_A_mu = mu(cutoff_1.0_A_div, 54000000)

# Use 3 years/generation
freedman_X_mu = mu(freedman_X_div, 54000000/3)
freedman_A_mu = mu(freedman_A_div, 54000000/3)

cutoff_0.0_X_mu = mu(cutoff_0.0_X_div, 54000000/3)
cutoff_0.0_A_mu = mu(cutoff_0.0_A_div, 54000000/3)

cutoff_0.2_X_mu = mu(cutoff_0.2_X_div, 54000000/3)
cutoff_0.2_A_mu = mu(cutoff_0.2_A_div, 54000000/3)

cutoff_0.4_X_mu = mu(cutoff_0.4_X_div, 54000000/3)
cutoff_0.4_A_mu = mu(cutoff_0.4_A_div, 54000000/3)

cutoff_0.6_X_mu = mu(cutoff_0.6_X_div, 54000000/3)
cutoff_0.6_A_mu = mu(cutoff_0.6_A_div, 54000000/3)

cutoff_0.8_X_mu = mu(cutoff_0.8_X_div, 54000000/3)
cutoff_0.8_A_mu = mu(cutoff_0.8_A_div, 54000000/3)

cutoff_1.0_X_mu = mu(cutoff_1.0_X_div, 54000000/3)
cutoff_1.0_A_mu = mu(cutoff_1.0_A_div, 54000000/3)