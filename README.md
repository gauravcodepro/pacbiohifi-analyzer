# pacbiohifi-analyzer
a pacbio hifi clipper for the direct clipping from the pacbio hifi reads and generate the clipped reads.

- complete pacbio hifi analyzer class from reading, plotting, clipping, reading bam, generating the graphs, extracting the graph sequences coded today from start to finish.

- initiate the class as 
```
new = PACBIOHIFICLIPPER.new("samplepacbiohifi.fastq")
new.makeindex
new.getLength
new.getFasta
new.graphs # adding this evening 
new.getClippattern
new.setClipper
new.chopclipper
new.plotchips
new.networkx # adding this evening.
```

Gaurav Sablok \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany


