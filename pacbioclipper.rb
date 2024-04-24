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

def clipped(internal, external, output)
  if internal and output
    out = File.new(output, "w")
    pattern1 = "ATCTCTCTCTTTTCCTCCTCCTCCGTTGTTGTTGTTGAGAGAGAT"
    pattern2 = "AAAAAAAAAAAAAAAAAATTAACGGAGGAGGAGGA"
    pattern1indexstart = []
    pattern2indexstart = []
    pattern1indexend = []
    pattern2indexend = []
    for i in 0..@readpacbiohifi.values.length
      pattern1indexstart.push(@readpacbiohifi.values[i].index(pattern1))
      pattern2indexstart.push(@readpacbiohifi.values[i].index(pattern2))
    end
    for i in 0..pattern1indexstart.length
      pattern1indexend.push(pattern1indexstart.to_i+pattern1.length.to_i)
      pattern2indexend.push(pattern2indexend.to_i+pattern2.length.to_i)
    end
    clippedinternal = {}
    names = Array.new()
    indexfile.keys().each { | iter | names.push(iter.strip.split) }
    for i in 0..@readpacbiohifi.values.length
      clippedinternal[names[i]] = @readpacbiohifi[i].to_s.slice!(pattern1indexstart, pattern1indexend)
    end
    file = File.new(output, "w")
    for i in 0..clippedinternal.length
      file.write(clippedinternal.keys[i],"\n", clippedinternal.values[i+1]\n)
    end
    file.close
    puts {"the pacbiohifi file has been written"}
  end