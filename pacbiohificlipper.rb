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


  def


