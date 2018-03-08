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
