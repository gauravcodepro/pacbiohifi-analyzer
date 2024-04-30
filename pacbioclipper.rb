class PACBIOHIFICLIPPER
  # Author Gaurav Sablok
  # Universitat Potsdam
  # Date: 2024-4-24

def initialize(pacbiohififastq)
    # initialize the class with the pacbiohifi reads
    @pacbio = pacbiohififastq
    @readpacbiohifi = File.open(@pacbio, "r").readlines
    @internalclipper1 = "AAAAAAAAAAAAAAAAAATTAACGGAGGAGGAGGA"
    @internalclipper2 = "ATCTCTCTCTTTTCCTCCTCCTCCGTTGTTGTTGTTGAGAGAGAT"
end

def makeindex(option)
if option == "names"
indexfile = {}
for i in 0..@readpacbiohifi.length
   if @readpacbiohifi[i].to_s.start_with?("@")
     indexfile[@readpacbiohifi[i].strip.split[0]] = @readpacbiohifi[i+1].strip
   end
 end
return indexfile.keys()
  end
if option == "fasta"
indexfile = {}
for i in 0..@readpacbiohifi.length
   if @readpacbiohifi[i].to_s.start_with?("@")
     indexfile[@readpacbiohifi[i]] = @readpacbiohifi[i+1].strip
   end
 end
return indexfile.values()
end
end

def getLength(outfile)
  indexfile = {}
  for i in 0..@readpacbiohifi.length
     if @readpacbiohifi[i].to_s.start_with?("@")
       indexfile[@readpacbiohifi[i].strip.split[0]] = @readpacbiohifi[i+1].strip
     end
   end
  names = Array.new()
  indexfile.keys().each { |iter| names.push(iter.strip.split[0]) }
  length = Array.new()
  length.push(indexfile.values().map {|iter| iter.length })
  finallength = length.flatten
  file = File.new(outfile, "w")
  (0..names.length).each { |i|
    file.write(names[i], "\t", finallength[i], "\n")
  }
  file.close
  end

def getFasta(outfile)
  indexfile = {}
  for i in 0..@readpacbiohifi.length
    if @readpacbiohifi[i].to_s.start_with?("@")
      indexfile[@readpacbiohifi[i].strip.split[0]] = @readpacbiohifi[i+1].strip
    end
  end
  names = Array.new()
  indexfile.keys().each { |iter| names.push(iter.strip.split[0]) }
  output = File.new(outfile, "w")
  for i in 0..@readpacbiohifi.length
      output.write(">".to_s+names[i].to_s,"\n",@readpacbiohifi[i+1], "\n")
    end
  output.close
  end
  end

def getValues(outfile)
  valuestore = {}
  for i in 0..@readpacbiohifi.length
      if @readpacbiohifi[i].to_s.start_with?("@")
        valuesstore[@readpacbiohifi[i]] = @readpacbiohifi[i+2]
      end
      output = File.new(outfile, "w")
      for i in 0..valuesstore.keys()
        output.write(valuesstore.keys()[i].to_s, "\n", valuesstore.values()[i], "\n")
      end
      output.close
  end
end

def getClippattern()
  puts {"ATCTCTCTCTTTTCCTCCTCCTCCGTTGTTGTTGTTGAGAGAGAT"}
  puts {"AAAAAAAAAAAAAAAAAATTAACGGAGGAGGAGGA"}
end

def setClipper(file)
  if file
    clippatterns = {}
    readfile = File.open(file, "r").readlines.strip.split
    for i in 0..readfile.length
      clippatterns[i] = readfile[i]
    end
    return readfile
  end
end

def clipped(internal, output)
  if internal and output
    out = File.new(output, "w")
    pattern1 = "ATCTCTCTCTTTTCCTCCTCCTCCGTTGTTGTTGTTGAGAGAGAT"
    pattern2 = "AAAAAAAAAAAAAAAAAATTAACGGAGGAGGAGGA"
    pattern1start = []
    pattern2start = []
    pattern1end = []
    pattern2end = []
    ids = []
    @readpacbiohifi.keys.each { | iter | ids.push(iter.to_s.strip.split[0]) }
    @readpacbiohifi.values.each { | iter | pattern1start.push(iter.index(pattern1)) }
    @readpacbiohifi.values.each { | iter | pattern1end.push(iter.index(pattern1).to_i+pattern2.length) }
    @readpacbiohifi.values.each { | iter | pattern2start.push(iter.index(pattern1)) }
    @readpacbiohifi.values.each { | iter | pattern2end.push(iter.index(pattern1).to_i+pattern2.length) }
    length = []
    @readpacbiohifi.values.each { | iter | length.push(iter.length)}
    slicestart = []
    sliceend =[]
    for i in 0..@readpacbiohifi.values.length
      slicestart.push(@readpacbiohifi.values[i].to_s.slice(0,pattern1start[i]).to_s)
    end
    for i in 0..@readpacbiohifi.values.length
      sliceend.push(@readpacbiohifi.values[i].to_s.slice(pattern1end[i],length[i]).to_s)
    end
    for i in 0..slicestart.length
      file.write(">"ids[i],"\n",slicestart[i]+sliceend[i], "\n")
    end
    file.close
    puts {"the pacbiohifi file has been written"}
  end

def graphextract(graphstartnode, graphendnode)
  startnode = File.open(graphstartnode, "r").readlines
  endnode = File.open(graphendnode, "r").readlines
  startedges = []
  for i in 0..startnode.length
   startedges.push(startnode[i].strip)
  end
  endedges = []
  for i in 0..endnode.length
   endedges.push(endnode[i].strip)
  end
  ids = []
  @readpacbiohifi.keys.each { | iter | ids.push(iter.to_s.strip.split[0])}
  nodesequence = []
  for i in 0..@readpacbiohifi.values.length
      nodesequences.push(@readpacbiohifi.values[i].to_s.slice(startedges[i], endedges[i]).to_s)
  for i in 0..ids.length
      file.write(">"ids[i],"\n",nodesequence[i], "\n")
  end
  file.close
end
def extractspecific(file, output)
   if file and output
     readfile = File.open(file, "r").readlines
     ids = []
     for i in 0..readfile.length
        if readfile[i].to_s.start_with?("@")
          ids.push(readfile[i].to_s.strip)
        end
     end
    indexfile = {}
    for i in 0..@readpacbiohifi.length
      if @readpacbiohifi[i].to_s.start_with?("@")
        indexfile[@readpacbiohifi[i].strip.split[0]] = @readpacbiohifi[i+1].strip
      end
   end
   selected = []
   for i in 0..ids.length
    for j in 0..indexfile.keys().length
      if ids[i] == indexfile.keys()[j]
        selected.push(ids[i],indexfile.values()[j])
      end
    end
   end
   out = File.new(output, "w")
    for i in 0..selected.length
       out.write(">"+selected[i][0],"\n", selected[i][1], "\n")
    end
    outfile.close
  end

def pacbioalign(dirfile,option, thread)
    unless dirfile
      puts { "the protein files are needed for the alignment" }
    end
    if dirfile and option == "writecommand"
      readdir = Dir.children(Dir.open(dirfile))
      genomefile = []
      readdir.each{ |iter| genomefile.push(iter) if iter.end_with?(".fasta")}
      proteinfile = []
      readdir.each { |iter| proteinfile.push(iter) if iter.end_with?(".fa") }
    writecommand = []
    for i in 0..proteinfile.length-1
      writecommand.push("miniprot --gff -t #{thread} #{genomefile[i]} #{proteinfile[i]} > #{proteinfile[i]}.gff")
    end
    return writecommand
    end
    if dirfile and option=="commandrun"
      readdir = Dir.children(Dir.open(dirfile))
      genomefile = []
      readdir.each{ |iter| genomefile.push(iter) if iter.end_with?(".fasta")}
      proteinfile = []
      readdir.each { |iter| proteinfile.push(iter) if iter.end_with?(".fa") }
    writecommand = []
    for i in 0..proteinfile.length-1
      writecommand.push("miniprot --gff -t #{thread} #{genomefile[i]} #{proteinfile[i]} > #{proteinfile[i]}.gff")
    end
    for i in 0..writecommand.length
      `#{writecommand[i]}`
    end
    end
end
end
