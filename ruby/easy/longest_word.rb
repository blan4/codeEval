#author: Siganov Ilya
#date: 15.01.2014
<<-DOC
LONGEST WORD
CHALLENGE DESCRIPTION:
In this challenge you need to find the longest word in a sentence. If the sentence has more than one word of the same length you should pick the first one.

INPUT SAMPLE:
Your program should accept as its first argument a path to a filename. Input example is the following
some line with text
another line
Each line has one or more words. Each word is separated by space char.

OUTPUT SAMPLE:
Print the longest word in the following way.
some
another
DOC

fname = ARGV.first

File.readlines(fname).each do |line|
  next if line.strip.empty?
  puts line.split(' ').max { |a, b| a.length <=> b.length }
end