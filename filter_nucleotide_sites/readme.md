## Step 1: Remove functional sites that could be under direct selection
* Scripts for this part is under `SexBiased/filter_nucleotide_sites/1_rm_sites_under_direct_sel`

1. Download the ensemble gene file for canFam3 from the UCSC Table Browser

![GitHub Logo](https://github.com/tnphung/SexBiased/blob/master/pics/ensemble_UCSC.png)

* Save in `download/ensemble`

2. Process the downloaded ensemble genes BED file by extracting out the CHR, START, and END columns, and sort the BED file. I do this for each chromosome separately

```
./process_ensemble_gene_file.sh
```

3. Create BED files that represent regions of the genome that are outside of ensemble genes
```
./exclude_ensemble.sh
```
4. Download phastConsElements100way for hg19 from the UCSC Genome Browser

![GitHub Logo](https://github.com/tnphung/SexBiased/blob/master/pics/phastConsEl100way_hg19_UCSC.png)

* Save in `donwload/phastConsEl`

5. Use liftOver command line tool to convert hg19 coordinates to canFam3 coordinates
```
./hg19_canFam_liftOver.sh
```
* The output file from liftOver is `canFam_phastConsEl.bed`. Separate into each chromosome separately:
```
for i in {1..38} X; do
grep -w chr${i} canFam_phastConsEl.bed > canFam_phastConsEl_chr${i}.bed
done;
```

6. Create BED files that represent regions of the genome that are outside of ensemble genes AND are outside of phastCons
* Use the Python script `remove_phastCons_overlap.py`. See the wrapper script `wrapper_remove_phastCons_overlap.sh` for how to run the script.

7. Merge the output from Step 6 (above)
* Since the output from Step 6 above is one position in each BED line, merge them:

```
cd download/ensemble
for i in {1..38} X; do
cd chr${i};
bedtools merge -i chr${i}_outside_ensemble_rm_phastConsEl.bed > chr${i}_outside_ensemble_rm_phastConsEl_merge.bed;
cd ..;
done;
```

## Step 2: Remove sites near genes that could be affected by linked selection
* Scripts for this part is under `SexBiased/filter_nucleotide_sites/2_rm_sites_under_linked_sel`

**1. Generate tentative neutral site**

a. Generate a 1 nucleotide per line (1-based coordinate) that contains the tentative neutral sites

* Use the script `generate_tentative_neutral_sites.py`. See wrapper script `wrapper_generate_tentative_neutral_sites.sh` for how to specify inputs and outputs.

b. Generate a file that contain the START and END of each ensemble genes in 1-based (START and END are on separate line)

* Use the script `generate_1_based_ensemble.py`.

c. Concat output files from **a** and **b**

```
cd
outputs/obtain_putatively_neutral_regions

for i in {1..38} X; do 
cd chr${i}; 
cat chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_1_based.txt chr${i}_ensemble_clean_sort_1_based.txt > chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_ensemble_1_based.txt; 
cd ..; 
done;
```

