## Step 1: Remove functional sites that could be under direct selection

1. Download the ensemble gene file for canFam3 from the UCSC Table Browser

![GitHub Logo](https://github.com/tnphung/SexBiased/blob/master/pics/ensemble_UCSC.png)

* Save in `download/ensemble`

2. Process the downloaded ensemble genes BED file by extracting out the CHR, START, and END columns, and sort the BED file. I do this for each chromosome separately. 

```
./process_ensemble_gene_file.sh
```

3. Create BED files that represent regions of the genome that are outside of ensemble genes:
```
./exclude_ensemble.sh
```
