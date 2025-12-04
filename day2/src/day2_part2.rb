module InvalidProductKey
  def self.is_invalid_key(key)
    parsed_key = key.to_s
    return false if parsed_key.length == 1
    seq = parsed_key[0]
    len = parsed_key.length
    ind = 1
    is_invalid = true
    while ind < len do
      seq_len = seq.length
      return false if seq_len > len/2
      return false if seq_len > len - (ind - 1)
      com_seq = parsed_key[ind...ind+seq_len]
      if(seq == com_seq) then
        ind = ind + seq_len
        is_invalid = true
        next
      end
      seq = parsed_key[..ind]
      ind += 1
      is_invalid = false
    end
    return is_invalid
  end
end

if __FILE__ == $0
  input_path = File.join(__dir__, "input.txt")
  input = File.read(input_path)
  ranges = input.split(",").map{ |x| x.split("-").map(&:to_i) }
  invalid_key_sum = 0
  ranges.each do |range|
    (range[0]..range[1]).each do |key|
      if (InvalidProductKey.is_invalid_key(key)) then
        puts "invalid #{key}"
        invalid_key_sum += key
      end
    end
  end
  puts invalid_key_sum
end
