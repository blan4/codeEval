#author: Siganov Ilya
#date: 30.01.2014
<<-DOC
CHALLENGE DESCRIPTION:
Write a program which checks input numbers and determines whether a number is even or not.
INPUT SAMPLE: Your program should accept as its first argument a path to a filename. Input example is the following
701
4123
2936

OUTPUT SAMPLE: Print 1 if the number is even or 0 if the number is odd.
0
0
1
All numbers in input are integers > 0 and < 5000.
DOC

File.readlines(ARGV.first).each do |line|
  p line.to_i.even? ? 1 : 0
end