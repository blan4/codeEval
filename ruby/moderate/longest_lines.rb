file = File.open(ARGV.first)
n = file.readline.to_i

file
  .readlines
  .sort {|a,b| b.length <=> a.length }
  .take(n).each do |long_line|
    puts long_line
  end