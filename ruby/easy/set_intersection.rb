File.readlines(ARGV.last).each do |line|
  lists = line.strip.split(';').map{|list| list.split(',').map(&:to_i) }
  puts (lists[0] & lists[1]).join(',')
end