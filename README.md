# pacbiohifi-analyzer
a pacbiohifi analyzer for the pacbio hifi reads and gives all the information for the pacbiohifi reads from raw to the graph alignments

- complete pacbio hifi analyzer class from reading, plotting, clipping, reading bam, generating the graphs, extracting the graph sequences coded today from start to finish.this uses the exact string match algorithm for the clipping. 
- a graph edges function is also present. It you want to extract specific nodes and edges from the GFA graphs for the pangenomes. 
- added a new function pafsplicer for extracting the aligned regions and compairing them to the annotation regions. 
- adding a new function for the splcie junction reads and the overlapping reads across the sites. 

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
# align the reads to the genome for the pangenome construction. 
# provide the directory path containing the genome file ending in the .fasta and the protein files ending in the .fa, 
# if the option is writecommand, it will output a shell compatible run script for the 
# high performance computing and if the option is commandrun then it will run the alignment. 
- pacbiohifi.pacbioalign(dirpath) 
# pacbio splicer: added a new function which will read the pacbiohifi aligned reads and 
# for each of the reads aligned will extract the corresponding sequences, and if given will match them with the annotated regions.
-pacbiohifi.pafslicer(alignedfile, fastafile)
```
Gaurav \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany


