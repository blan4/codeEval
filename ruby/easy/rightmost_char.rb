#author: Siganov Ilya
#date: 06.02.2014
File.readlines(ARGV.last).each do |line|
  line = line.strip.split(',')
  text = line[0]
  char = line[1]
  last_index = -1
  text.split('').map.with_index do |ch,i|
    last_index = i if char.eql?(ch)
  end
  puts last_index
end