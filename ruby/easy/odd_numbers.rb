<<-DOC
ODD NUMBERS
CHALLENGE DESCRIPTION: Print the odd numbers from 1 to 99.
There is no input for this program.
OUTPUT SAMPLE: Print the odd numbers from 1 to 99, one number per line. 
DOC
puts (1..99).to_a.select(&:odd?)