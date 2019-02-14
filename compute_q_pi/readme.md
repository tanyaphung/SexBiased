## Step 1: Compute (uncorrected) diversity (pi)
* Scripts for this part is under `SexBiased/compute_q_pi/1_compute_uncorrected_pi`
* Use the script `compute_pairwise_diversity.py` that calls the helper scripts `compute_AF.py` and `compute_diversity.py`. 
* See the wrapper script `wrapper_computepairwiseDiversity_GS.sh` for how to specify the inputs and outputs.

## Step 2: Compute dog-cat divergence

* I downloaded the pairwise (.axt) alignment between dog and cat (canFam3/felCat8) from the UCSC genome browser (http://hgdownload.cse.ucsc.edu/downloads.html). However, this pairwise alignment is no longer on the UCSC website. The .axt file is available upon request.

* Process the axt file:
  - Use the script `process_axtFileFormat.sh`.
 
* Remove gap ('-') in the canFam sequence (so that index is correct)
  - Use the script `remove_gaps_axt.py`:
  ```
  python remove_gaps_axt.py canFam3.felCat8.net.axt_rmHeader_canFam3_sequence canFam3.felCat8.net.axt_rmHeader_felCat8_sequence canFam3.felCat8.net.axt_rmHeader_canFam3_sequence_gaps_removed canFam3.felCat8.net.axt_rmHeader_felCat8_sequence_gaps_removed 
  ```
* To compute dog-cat divergence, use the script `compute_divergence.py`. 
  - See wrapper script `wrapper_compute_dog_cat_divergence.sh` for how to specify inputs and outputs.

## Step 3: Compute uncorrected and corrected diversity and X/A diveristy ratio

* See the script `3_compute_corrected_pi/compute_corrected_diversity.R` for how to compute the following statistics for a population:
  - Uncorrected and corrected diversity on the X chromosome
  - Uncorrected and corrected diversity on the autosomes
  - Uncorrected and corrected X/A diversity ratio
  - Dog-cat divergence
  
## Step 4: Construct 95% confidence interval by bootstrapping
**1. Prepare the empirical data to generate bootstraps on**

* We want to generate the bootstraps for diversity and divergence using the same regions. So, we need to merge the divesity output files and the divergence output files. 

```
pwd
/u/home/p/phung428/nobackup-kirk/tanya_data/Sex_Biased_Demography/scripts/compute_ci/compute_ci_diversity_divergence

./merge_diversity_divergence.sh
```

**2. Generate bootstraps**
* Use the script `4_construct_ci/generate_bootstraps.py`. 
* See wrapper script `wrapper_generate_bootstraps.sh` for how to specify inputs and outputs. Note that if one is to run this, I would suggest running it as an array jobs with a few replicates at a time, because it does take sometime to generate the bootstraps.

**3. Remove PAR from chrX in the empirical data and in each bootstrap**
* Use the script `4_construct_ci/rm_PAR_emp_bootstraps.sh`.

**4. Compute 95% CI**

* Use the script `4_construct_ci/compute_ci.py`
  - See wrapper script `wrapper_compute_ci.sh` for how to specify inputs and outputs
  
  ## Temporary Step 5: Revise how to calculate uncorrected pi
  
  * Use `popgen_tools.py`
  
  ```
  git clone https://github.com/tanyaphung/popgen_tools.git
  ```
    - Make sure to install the approporiate Python version and pandas for popgen_tools.py to work. 
    
  * Here, we want to calculate pi for each population for each cutoff (in defining putatively neutral regions). Inputs are the vcf files and the bed files specifying putatively neutral regions. 
  * This is an example of how to run popgen_tools.py to calculate for German Shepherds with cutoff of 1cM:
  
  ```
  python popgen_tools.py --vcf_file vcfs/cutoff_1.0/cutoff_1.0_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed.vcf --names_list pop/GS.txt --pi --pi_target --target_bed target_bed/cutoff_1.0/autosomes_cutoff_1.0_putative.neutral_high.qual_alignable.bed --pi_target_out out/cutoff_1.0/GS/A/pi_target_out.txt --pi_target_per_site out/cutoff_0.6/GS/A/pi_target_per_site.txt
  ```
    - Then, view the output `pi_target_per_site.txt`:
    ```
    cat out/cutoff_1.0/GS/A/pi_target_per_site.txt
    pi_per_site
    0.0012329772419216694
    ```
    
