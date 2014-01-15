#author: Siganov Ilya
#date: 15.01.2014
<<-DOC
FIBONACCI SERIES
CHALLENGE DESCRIPTION:
The Fibonacci series is defined as: F(0) = 0; F(1) = 1; F(n) = F(n-1) + F(n-2) when n>1. Given a positive integer 'n', print out the F(n).

INPUT SAMPLE:
The first argument will be a path to a filename containing a positive integer, one per line. E.g.
5
12

OUTPUT SAMPLE:
Print to stdout, the fibonacci number, F(n). E.g.
5
144
DOC

fib = Enumerator.new do |y|
  a = b = 1
  loop do
    y << a
    a, b = b, a + b
  end
end

File.open(ARGV.first).each_line do |line|
  if line.to_i.zero?
    puts 0
  else
    puts fib.take(line.to_i).last
  end
end