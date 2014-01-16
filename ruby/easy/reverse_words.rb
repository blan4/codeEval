#author: Siganov Ilya
#date: 15.01.2014
<<-DOC
REVERSE WORDS
CHALLENGE DESCRIPTION:
Write a program to reverse the words of an input sentence.

INPUT SAMPLE:
The first argument will be a path to a filename containing multiple sentences, one per line. Possibly empty lines too. E.g.
Hello World
Hello CodeEval

OUTPUT SAMPLE:
Print to stdout, each line with its words reversed, one per line. Empty lines in the input should be ignored. Ensure that there are no trailing empty spaces on each line you print. E.g.
World Hello
CodeEval Hello
DOC

fname = ARGV.first
raise 'File name not specified' if fname.nil? || fname.empty?

res = File.readlines(fname).map do |line|
  next if line.strip.empty?
  line.strip.split(/ /).reverse.join(' ')
end

res.each do |line|
  puts line unless line.nil?
end