#author: Siganov Ilya
#date: 15.01.2014
<<-DOC
SUM OF DIGITS
CHALLENGE DESCRIPTION:
Given a positive integer, find the sum of its constituent digits.

INPUT SAMPLE:
The first argument will be a path to a filename containing positive integers, one per line. E.g.
23
496

OUTPUT SAMPLE:
Print to stdout, the sum of the numbers that make up the integer, one per line. E.g.
5
19
DOC

class Integer
  def split_by_digits(base)
    number = self
    digits = []
    begin
      digits.push(number % base)
      number /= base
    end until number.zero?

    digits
  end
end


fname = ARGV.first
File.readlines(fname).each do |line|
  number = line.to_i
  puts number.split_by_digits(10).inject(0) { |res,el| res+el }
end