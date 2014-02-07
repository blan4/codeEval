#author: Siganov Ilya
#date: 03.02.2014
File.readlines(ARGV.last).each do |line|
  raw = line.strip.split(' ')
  list = raw[0..-2]
  n = raw.last.to_i
  next if n > list.length
  puts list[n % list.length]
end