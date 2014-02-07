#author: Siganov Ilya
#date: 02.02.2014

File.readlines(ARGV.last).each do |line|
  origin_numbers = line.strip.split(' ').map(&:to_i)
  numbers = origin_numbers.sort
  counter = {}
  numbers.each do |num|
    counter[num] ||= 0
    counter[num] += 1
  end
  winner = 0
  counter.each do |key, value|
    if value == 1
      winner = origin_numbers.index(key) + 1
      break
    end
  end
  puts winner
end