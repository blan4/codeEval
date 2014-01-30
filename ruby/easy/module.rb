#author: Siganov Ilya
#date: 30.01.2014
<<-DOC
CHALLENGE DESCRIPTION:
Given two integers N and M, calculate N Mod M (without using any inbuilt modulus operator).

INPUT SAMPLE: Your program should accept as its first argument a path to a filename. Each line in this file contains two comma separated positive integers. E.g.
20,6
2,3
You may assume M will never be zero.
DOC
File.readlines(ARGV.last).each do |line|
  numbers = line.split(',').map(&:to_i)
  n, m = numbers[0], numbers[1]
  puts (n - (n/m) * m)
end