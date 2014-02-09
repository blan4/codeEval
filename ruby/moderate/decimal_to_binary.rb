#author: Siganov Ilya
#date: 09.02.2014
class Integer
  def to_bin
    decimal = self
    bits = ''
    begin
      bits << (decimal & 0x1).to_s
      decimal >>= 1
    end until decimal.zero?
    
    bits.reverse
  end
end

File.readlines(ARGV.last).each do |line|
  puts line.to_i.to_bin
end