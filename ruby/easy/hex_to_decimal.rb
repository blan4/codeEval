File.readlines(ARGV.last).each do |line|
  puts line.to_i(16)
end