#author: Siganov Ilya
#date: 02.02.2014
words = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }

File.readlines(ARGV.last).each do |line|
  res = line.strip.split(';').map do |digit|
    words[digit.to_sym]
  end.join
  puts res
end