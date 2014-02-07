def primes(supremum)
  numbers = (2..supremum).to_a
  is_primes = Array.new(numbers.length, true)
  length = numbers.length
  n = (length ** 0.5).to_i
  
  n.times do |index|
    prime = numbers[index]
    index.next.upto(length-1) do |i|
      is_primes[i] = false if (numbers[i] % prime).zero?
    end
  end
  numbers.select.with_index {|el,i| el if is_primes[i]}
end

File.readlines(ARGV.last).each do |line| 
  puts primes(line.to_i).join(',')
end