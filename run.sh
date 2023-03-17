xmllint --xpath '//pub-date[@pub-type="pmc-release"]/year' nf_science_nature.xml | sed 's/\<\/year\>/\n/'g| sed 's/\<year\>//g' | awk '{print $0 "\tNextflow"}' > nf_sm_science_nature.txt
xmllint --xpath '//pub-date[@pub-type="pmc-release"]/year' sm_science_nature.xml | sed 's/\<\/year\>/\n/'g| sed 's/\<year\>//g' | awk '{print $0 "\tSnakemake"}' >> nf_sm_science_nature.txt

Rscript run.R
