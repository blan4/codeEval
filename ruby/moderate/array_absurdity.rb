#author: Siganov Ilya
#date: 09.02.2014
File.readlines(ARGV.last).each do |line|
  data = line.split(';')
  array = data.last.split(',').map(&:to_i)
  good_array = Array.new(data.first.to_i)
  repeated_el = -1
  array.each do |el|
    if good_array[el].nil?
      good_array[el] = el
    else
      repeated_el = el
      break
    end
  end

  puts repeated_el
end