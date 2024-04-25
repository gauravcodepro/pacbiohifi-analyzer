# pacbiohifi-analyzer
a pacbiohifi analyzer for the pacbio hifi reads and gives all the information for the pacbiohifi reads from raw to the graph alignments

- complete pacbio hifi analyzer class from reading, plotting, clipping, reading bam, generating the graphs, extracting the graph sequences coded today from start to finish.

- this uses the exact string match algorithm for the clipping. 

- initiate the class as 
```
pacbiohi = PACBIOHIFICLIPPER.new("samplepacbiohifi.fastq")
# will read and make the index for the PacBiohifi
pacbiohifi.makeindex
# will give you a tab delimited file for the PacBiohifi
pacbiohifi.getLength
# will give you the fasta file for the PacBiohifi
pacbiohifi.getFasta
# implementing the graph
pacbiohifi.graphs 
# will print the default PacBiohifi clippers
pacbiohifi.getClippattern 
# you can define a new txt file containing the clipping patterns
pacbiohifi.setClipper 
pacbiohifi.chopclipper
# plotter for the length and also the chipped length
pacbiohifi.plotchips
# plots the graphs as networks and graphql
pacbiohifi.networkx 
# this will extract specific sequences if you want and those aligns in the graphs. 
pacbiohifi.extractspecific 
# search for the specific patterns in the PacBiohifi reads 
# exact match and linear search array 
pacbiohifi.search
# align the reads to the genome for the pangenome construction
pacbiohifi.align # writing now 
# extract the graph edges 
pacbiohifi.extract # writing now 
```
- this will be pushed as a gem next week so that you can install directly. A brew file will be also present. 

- a part of this is also written in Rubex, a parallel implementation of the C++ but less to make it easier for others. 

Gaurav Sablok \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany


