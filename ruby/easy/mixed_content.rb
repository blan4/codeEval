#author: Siganov Ilya
#date: 18.01.2014
<<-DOC
MIXED CONTENT
CHALLENGE DESCRIPTION: You have a string of words and digits divided by comma. Write a program which separates words with digits. You shouldn't change the order elements.

INPUT SAMPLE: Your program should accept as its first argument a path to a filename. Input example is the following
8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21
24,13,14,43,41

OUTPUT SAMPLE:
melon,apricot,peach,pineapple|8,33,21,0,16,50,37,0,7,17,21
24,13,14,43,41

As you cas see you need to output the same input string if it has words only or digits only.
DOC
class String
  def is_number?
    true if Integer(self) rescue false # ruby raise error if cant create Integer object from not_number string
  end
end

File.readlines(ARGV.first).each do |line|
  numbers, words = [], []

  line.strip.split(',').each do |chunk|
    if chunk.is_number?
      numbers.push chunk
    else
      words.push chunk
    end
  end

  puts [words.join(','), numbers.join(',')].select{ |el| !el.empty? }.join('|')
end
