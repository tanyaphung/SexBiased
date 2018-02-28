#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load bedtools

bedtools closest -a $1 -b $2 > $3

sed -i 's/ \+ /\t/g' $3
sed -i 's/ /\t/g' $3

awk '{print$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"($6 -1)}' $3 > $4
