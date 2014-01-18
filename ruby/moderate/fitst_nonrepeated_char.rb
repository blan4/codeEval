#author: Siganov Ilya
#date: 18.01.2014
<<-DOC
FIRST NON-REPEATED CHARACTER
CHALLENGE DESCRIPTION:
Write a program to find the first non repeated character in a string.

INPUT SAMPLE: The first argument will be a path to a filename containing strings. E.g.
yellow
tooth

OUTPUT SAMPLE: Print to stdout, the first non repeating character, one per line. E.g.
y
h
DOC
File.readlines(ARGV.first).each do |line|
  line
    .split('')
    .group_by { |letter| letter }
    .map {|letter, repeats| {letter: letter, repeats: repeats.length} }
    .each do |info|
      if info[:repeats] == 1
        puts info[:letter]
        break
      else
        next
      end
    end
end
