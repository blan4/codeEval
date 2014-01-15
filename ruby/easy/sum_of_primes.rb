#author: Siganov Ilya
#date: 15.01.2014
<<-DOC
SUM OF PRIMES
CHALLENGE DESCRIPTION:
Write a program to determine the sum of the first 1000 prime numbers.

INPUT SAMPLE:
There is no input for this program.

OUTPUT SAMPLE:
Your program should print the sum on stdout, i.e.
3682913
DOC

N = 1000

def prime?(num)
  n = (num ** 0.5).to_i
  i = 2
  i.upto(n) do |cur|
    return false if (num % cur).zero?
  end
  true
end

enum = Enumerator.new do |seq|
  first = 2
  seq << first
  loop do 
    first = first.next
    seq << first if prime?(first)
  end
end

p enum.take(N).inject(0) {|result, elem| result + elem}