#author: Siganov Ilya
#date: 30.01.2014
<<-DOC
CHALLENGE DESCRIPTION:
You have coordinates of 2 points and need to find the distance between them.
INPUT SAMPLE: Your program should accept as its first argument a path to a filename. Input example is the following
(25, 4) (1, -6)
(47, 43) (-25, -11)
All numbers in input are integers between -100 and 100.

OUTPUT SAMPLE: Print results in the following way.
26
90
You don't need to round the results you receive. 
They must be integer numbers between -100 and 100.
DOC

def distance(dot_1, dot_2)
  ((dot_1[:x] - dot_2[:x]) ** 2 + (dot_1[:y] - dot_2[:y]) ** 2) ** 0.5
end

File.readlines(ARGV.first).each do |line|
  coords = line.scan(/-?\d+/)
  dot_1 = Hash[[[:x, :y], coords[0..1].map(&:to_i)].transpose]
  dot_2 = Hash[[[:x, :y], coords[2..3].map(&:to_i)].transpose]
  p distance(dot_1, dot_2).to_i
end