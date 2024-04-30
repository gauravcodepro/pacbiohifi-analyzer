# pacbiohifi-analyzer
a pacbiohifi analyzer for the pacbio hifi reads and gives all the information for the pacbiohifi reads from raw to the graph alignments

- complete pacbio hifi analyzer class from reading, plotting, clipping, reading bam, generating the graphs, extracting the graph sequences coded today from start to finish.

- this uses the exact string match algorithm for the clipping. 

- initiate the class as 
```
# class initialize or the gem initialize
- pacbiohi = PACBIOHIFICLIPPER.new("samplepacbiohifi.fastq")
# will read and make the index for the PacBiohifi
- pacbiohifi.makeindex
# will give you a tab delimited file for the PacBiohifi
- pacbiohifi.getLength
# will give you the fasta file for the PacBiohifi
- pacbiohifi.getFasta
# provide the graph start and end nodes and it will clip the pacbiohifi aligned for those edges
- pacbiohifi.graphextract
# will print the default PacBiohifi clippers
- pacbiohifi.getClippattern 
# you can define a new txt file containing the clipping patterns
- pacbiohifi.setClipper 
# clips the sequences of the specific positions and write the revised fasta.
- pacbiohifi.clipper
# search for the specific patterns in the PacBiohifi reads 
- pacbiohifi.search
# align the reads to the genome for the pangenome construction. provide the directory path containing the genome file ending in the .fasta and the protein files ending in the .fa, if the option is writecommand, it will output a shell compatible run script for the high performance computing and if the option is commandrun then it will run the alignment. 
- pacbiohifi.pacbioalign(dirpath)   
```
- this will be pushed as a gem next week so that you can install directly. A brew file will be also present. 

- a part of this is also written in Rubex, a parallel implementation of the C++ but less to make it easier for others. 

Gaurav Sablok \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany


