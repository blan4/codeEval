#author: Siganov Ilya
#date: 03.02.2014
puts File.readlines(ARGV.last).map{ |line| line.to_i }.reduce(:+)