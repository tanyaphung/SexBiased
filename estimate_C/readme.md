## Step 1: Obtain the site frequency spectrum (SFS)

**1. Use GATK to subset the VCFs**

* Only interested in the variants that are outside of genes, outside of conserved regions, far away from genes as defined by multiple thresholds, high in quality from whole genome sequencing, and alignable between dog and cat. See Step 4 in `filter_nucleotide_sites`.

* Use the script `1_obtain_SFS/subset_VCF.sh`.
  - **Notes:** for the X chromosome, the PAR is removed.
  
**2. Use VCFtools to obtain the genotype from the VCF files**

* Since my script to generate the SFS takes in input that is not a VCF file but just the genotypes (for computational efficiency), I will use VCFtools to extract out just the genotypes (GT) from the VCF files.

* Use the script `1_obtain_SFS/obtain_GT_from_VCF.sh`

**3. Clean the genotype files**
* Since I extracted out the genotypes for each population separately, there are some variants where they are all homozygous for a particular population. So, I used the script `1_obtain_SFS/clean_genotype_files.py` to remove all the variants that are monomorphic (0/0 or 1/1) for each population.
  - See wrapper script `wrapper_clean_genotypes_files.sh` for how to specify inputs and outputs

**4. Generate SFSs**

* Use the script `1_obtain_SFS/generate_foldedSFS.py`\
  - See wrapper script `wrapper_generate_foldedSFS.sh` for how to specify inputs and outputs

* Since I generated the counts for the SFS for each chromosome separately, need to add up the counts across 38 autosomal chromosomes:
  - Use the script `1_obtain_SFS/tabulate_foldedSFS.py`
  - See script `wrapper_tabulate_foldedSFS.sh` for how to specify inputs and outputs

## Step 2: Compute mutation rate from divergence

* Use the script `2_compute_mutation_rates/compute_mu_from_divergence.R`

## Step 3: Infer demographic parameters using the SFSs on the autosomes

* I used fastsimcoal2 (Excoffier, L., Dupanloup, I., Huerta-Sánchez, E., Sousa, V.C., and M. Foll (2013) Robust demographic inference from genomic and SNP data. PLOS Genetics, 9(10):e1003905.) to infer demographic parameters using the autosomal site frequency spectrum.
* I inferred the demographic parameters for each population and for multiple thresholds of defining putatively neutral regions (>0.4 cM, >0.6 cM, >0.8 cM, >1 cM). 
* Included in the folder `3_infer_demographic_parameters` is how to prepare inputs to infer demographic parameters for the German Shepherd population using >0.4 cM as the threshold:
  - `fastsimcoal_script.sh`
  - `GS_bottleneck.tpl`: the template file. Sample size is the number of haploid (here, since there are 4 German Shepherd individuals, sample size is equal to 8). Mutation rate is the autosomal mutation rate computed from dog-cat divergence as in **Step 2** above.
  - `GS_bottleneck.est`: the estimation file
  - `GS_bottleneck_MAFpop0.obs`: specifying the site frequency spectrum in counts.
* The inferred demographic parameters that yield the highest likelihood are found in Phung et al. (in prepaparation) Supplementary Table 5.


