#author: Siganov Ilya
#date: 02.02.2014
File.open(ARGV[0]).each_line do |line|
    res = line.strip.split(' ').map do |word|
        letters = word.split('')
        letters[0].capitalize!
        letters.join('')
    end.join(' ')
    puts res
end