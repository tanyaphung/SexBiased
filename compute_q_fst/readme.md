## Step 1: Compute FST

**1. Concat the variants from 38 chromosomes into one file**
* Use the script `1_compute_fst/cat_variants.sh`

**2. Use the package SNPRelate to compute FST**

* Note: Since the number of individuals in each population is not the same, for this analysis, we subsampled the samples such that there are 4 individuals in each population. The strategy here is to label only 4 inviduals in each population in the pop.txt file (See the file `1_compute_fst/pop_subsample.txt`)

* Use the script `1_compute_fst/fst_snprelate.R`
  - See wrapper script `wrapper_fst_snprelate.sh` for how to specify inputs and outputs.
  
## Step 2: Compute QFST

* Use the script `2_compute_q_fst/compute_qfst.R`.
  - See wrapper script `wrapper_compute_qfst.sh` for how to specify inputs and outputs.
 
## Step 3: Construct 95% confidence interval

* Because SNPRelate requires input to be VCF files, we will generate bootstrapped VCF file. 

**1. Remove header from the VCF files**

* Use the script `3_construct_ci/remove_header_from_VCF.sh`.

**2. Generate 1000 bootstrapped VCF files for autosomes and chrX for each cutoff**

* Use the script `3_construct_ci/generate_bootstrap_vcf.py`.
  - See wrapper script `wrapper_generate_bootstrap_vcf.sh` for how to specify inputs and outputs.

**3. Sort the bootstrapped VCF files

* Use the script `3_construct_ci/picard_sort_vcf.sh`.

**4. Compute FST for each bootstrapped VCF by using SNPRelate**

* Use the script `SexBiased/compute_q_fst/1_compute_fst/fst_snprelate.R`.
  - See wrapper script `3_construct_ci/wrapper_fst_snprelate_bootstrap.sh` for how to specify inputs and outputs for an example GS-TM pair.

**5. Concatenate all fst values from 1000 bootstraps**

* Use the script `3_construct_ci/cat_all_bootstraps.sh`.

**6. Compute 95% confidence interval**

* Use the script `3_construct_ci/compute_ci.py`.
  - See wrapper script `wrapper_compute_ci.sh` for how to specify inputs and outputs.
