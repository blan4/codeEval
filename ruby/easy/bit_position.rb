File.readlines(ARGV.last).each do |line|
  numbers = line.strip.split(',').map(&:to_i)
  res = numbers[0] >> (numbers[1]-1) & 0x1 == numbers[0] >> (numbers[2]-1) & 0x1 ? true : false
  puts res
end