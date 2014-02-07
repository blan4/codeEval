#author: Siganov Ilya
#date: 30.01.2014
File.readlines(ARGV.last).each do |line|
  puts line.strip.split(',').map(&:to_i).uniq.join(',')
end