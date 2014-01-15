#author: Siganov Ilya
#date: 15.01.2014
<<-DOC
PRIME PALINDROME
CHALLENGE DESCRIPTION:
Write a program to determine the biggest prime palindrome under 1000.

INPUT SAMPLE:
There is no input for this program.

OUTPUT SAMPLE:
Your program should print the largest palindrome on stdout, i.e.
929
DOC

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

def palindrom?(num)
  num.to_s.eql? num.to_s.reverse
end

palindroms = primes(1000).select do |prime|
  prime if palindrom?(prime)
end

p palindroms.last 