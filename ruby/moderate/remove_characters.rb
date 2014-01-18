#author: Siganov Ilya
#date: 18.01.2014
<<-DOC
REMOVE CHARACTERS
CHALLENGE DESCRIPTION:
Write a program to remove specific characters from a string.

INPUT SAMPLE: The first argument will be a path to a filename containing an input string followed by a comma and then the characters that need to be scrubbed. E.g.
how are you, abc
hello world, def
OUTPUT SAMPLE: Print to stdout, the scrubbed strings, one per line. Trim out any leading/trailing whitespaces if they occur. E.g.
how re you
hllo worl
DOC
File.readlines(ARGV.first).each do |line|
  line = line.split(',')
  reg = Regexp.new("[#{line.last.strip}]")
  puts line.first.gsub reg, ''
end