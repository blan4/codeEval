#author: Siganov Ilya
#date: 17.01.2014
<<-DOC
ARMSTRONG NUMBERS
CHALLENGE DESCRIPTION:
An Armstrong number is an n-digit number that is equal to the sum of the n'th powers of its digits. Determine if the input numbers are Armstrong numbers.

INPUT SAMPLE: Your program should accept as its first argument a path to a filename. Each line in this file has a positive integer. E.g.
6
153
351

OUTPUT SAMPLE: Print out True/False if the number is an Armstrong number or not. E.g.
True
True
False
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

File.readlines(ARGV.first).each do |line|
  number = line.to_i
  arm = number.split_by_digits(10).map{|digit| digit**number.to_s.length}.reduce(:+)
  puts number.eql?(arm) ? 'True' : 'False'
end