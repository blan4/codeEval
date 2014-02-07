#author: Siganov Ilya
#date: 06.02.2014
File.readlines(ARGV.last).each do |line|
  puts line.strip.split(' ')[-2]
end