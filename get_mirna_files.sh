#!/bin/bash

# Download and unpack all miRNA RNA-Seq data from Broad GDAC side
# Invoke as follows: $ ./[path_to_script]/get_mirna_files.sh
# Output is a series of directories, one for each cancer code
# Output data files then loaded into PostgreSQL database


URL_TEMPLATE=http://gdac.broadinstitute.org/runs/stddata__2016_01_28/data/%s/20160128/gdac.broadinstitute.org_%s.Merge_mirnaseq__illuminahiseq_mirnaseq__bcgsc_ca__Level_3__miR_gene_expression__data.Level_3.2016012800.0.0.tar.gz
for cancer_code in ACC BLCA BRCA CESC CHOL COAD DLBC ESCA FPPP GBM HNSC KICH KIRC KIRP LAML LGG LIHC LUAD LUSC MESO OV PAAD PCPG PRAD READ SARC SKCM STAD TGCT THCA THYM UCEC UCS UVM
do
    URL=$(printf $URL_TEMPLATE	"$cancer_code" "$cancer_code")
    echo "Getting " $URL
    wget $URL
done

for GZIP_FILE in $(ls *gz)
do
	echo "Unpacking " $GZIP_FILE
	tar -xvf $GZIP_FILE
done

