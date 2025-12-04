path = File.join(__dir__, "input.txt")
input = File.read(path)

batteries = input.split("\n").map(&:to_i)
max_voltage = 0
batteries.each do |battery|
  max = {index: 0, value: 0}
  second_max = {index: 0, value: 0}
  index = 0
  while battery > 0 do
    digit = battery % 10
    battery /= 10
    if (digit >= max[:value]) then
      second_max = max.dup
      max[:index] = index
      max[:value] = digit
    elsif (digit > second_max[:value] && (index < max[:index] || max[:index] == 0)) then
      second_max[:index] = index
      second_max[:value] = digit
    end
    index += 1
  end
  tenth_digit = 0
  ones_digit = 0
  if (max[:index] > second_max[:index]) then
    tenth_digit = max[:value]
    ones_digit = second_max[:value]
  else
    tenth_digit = second_max[:value]
    ones_digit = max[:value]
  end
  max_voltage += tenth_digit*10+ones_digit
end

puts  max_voltage

