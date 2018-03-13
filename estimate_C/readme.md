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
  - `GS_bottleneck_MAFpop0.obs`: specifying the site frequency spectrum in counts (for autosomes)
* The inferred demographic parameters that yield the highest likelihood are found in Phung et al. (in prep) Supplementary Table 5.

## Step 4: Infer C (NX/NA ratio)

* I used fastsimcoal2 to simulate the site frequency spectrum using the inferred demographic parameters from the autosomes (**Step 3** above) for the X chromosome. 
* Included in the folder `4_infer_C` is how to prepare inputs and outputs to generate the SFS for the German Shepherd population using >0.4 cM as the threshold, and setting C to be equal to 0.75:
  - `GS_bottleneck_MAFpop0.obs`: specifying the site frequency spectrum in counts (for the X chromosome)
  - `GS_bottleneck.par`: this is the parameter file that is an output from **Step 3** above. After running the `fastsimcoal_script.sh` script in **Step 3**, a folder called `GS_bottleneck` is generated where the file `GS_bottleneck_maxL.par` specifying demographic parameters that resulted in the highest likelihood. One would need to change the file name to `GS_bottleneck.par`. In addition:
    + Replace the population effect sizes to be match that for the X chromosome. For example, the inferred population effectize sizes from the autosomes was 16235. Here, we set C to be equal to 0.75, and so the population effective sizes from the X chromosome is 0.75*16235 = 12176.25.
    + Replace the **data type** to be SNP instead of FREQ.
    + Replace the **num loci** to be equal to the total number of sites with that threshold. 
    + Replace the **mut rate** to be that for the X chromosome
    
  - `fastsimcoal_script.sh`
  
* When running `./fastsimcoal_script.sh`, a directory called `GS_bottleneck` is created where the file of interest is `GS_bottleneck_MAFpop0.obs` that contains the SFS for 100000 observations (because we specified in the `fastsimcoal_script.sh` to do 100000 replicates. For each bin of the SFS, averaging across 100000 replicates would give you the count for that bin.

* I repeated this procedure for each population, for each threshold, and for each grid value of C.

## Step 5: Access the fit
**1. Compute Poisson likelihood to compare the empirical SFS and simulated SFS**

* See the script `5_access_fit/compute_loglikelihood.R` for an example for the German Shepherd population:
  - For the autosomes, comment out the X chromosome calculations (line 40 to 67):
    + Usage: Rscript compute_loglikelihood.R /path/to/A/empirical/ /path/to/A/sim
  - For the X chromosome, comment out the autosomes calculations (line 21 to 37):
    + Usage: Rscript compute_loglikelihood.R /path/to/directory/ /filename/of/X/empirical/ /filename/of/X/sim/ /outfile/end/in/csv/ /value/of/C/
  - **NOTES:** for the other population, be sure to modify `emp_counts` and `sim_counts` to reflect the number of bins for that population. 
  
**2. Compute diversity from SFS**

* See the script `5_access_fit/compute_diversity_from_SFS.R` for an example for the German Shepherd population:
  - Usage: Rscript compute_diversity_from_SFS.R /path/to/A/empirical/ /path/to/A/sim/ /path/to/X/empirical/ /path/to/X/sim/with/null/C/ /path/to/X/sim/with/best/C/
 
**3. Compute likelihood ratio test**

* See the script `5_access_fit/compute_LRT.R`
  
