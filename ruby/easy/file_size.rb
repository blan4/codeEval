#author: Siganov Ilya
#date: 15.01.2014
<<-DOC
FILE SIZE
CHALLENGE DESCRIPTION:
Print the size of a file in bytes.

INPUT:
The first argument to your program has the path to the file you need to check the size of.

OUTPUT SAMPLE:
Print the size of the file in bytes. E.g.
55
DOC

puts File.size(ARGV.first)