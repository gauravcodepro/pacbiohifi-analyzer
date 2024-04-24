# pacbiohifi-analyzer
a pacbiohifi analyzer for the pacbio hifi reads and gives all the information for the pacbiohifi reads from raw to the graph alignments

- complete pacbio hifi analyzer class from reading, plotting, clipping, reading bam, generating the graphs, extracting the graph sequences coded today from start to finish.

- this uses the exact string match algorithm for the clipping. 

- initiate the class as 
```
pacbiohi = PACBIOHIFICLIPPER.new("samplepacbiohifi.fastq")
pacbiohifi.makeindex
pacbiohifi.getLength
pacbiohifi.getFasta
pacbiohifi.graphs # adding this evening 
pacbiohifi.getClippattern # will print the default PacBiohifi clippers
pacbiohifi.setClipper # you can define a new txt file containing the clipping patterns
pacbiohifi.chopclipper
pacbiohifi.plotchips
pacbiohifi.networkx # adding this evening.
```
- a part of this is also written in Rubex, a parallel implementation of the C++ but less to make it easier for others. 

Gaurav Sablok \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany


