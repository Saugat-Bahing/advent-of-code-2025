path = File.join(__dir__, "input.txt")
input = File.read(path)

def largest_after(arr, after, before)
  max = 0
  max_ind = after
  while (after < before) do
    if (arr[after] >= max) then
      max = arr[after]
      max_ind = after
    end
    after += 1
  end
  return max_ind
end

batteries = input.split("\n").map(&:to_i)
max_voltage = 0
batteries.each do |battery|
  index = 0
  values = []

  while battery > 0 do
    digit = battery % 10
    values.push(digit)
    battery /= 10
    index += 1
  end

  i = 0
  max_joltage = 0
  before = values.length
  while (i < 12) do
    before = largest_after(values, 11-i, before)
    max_joltage += values[before] * (10 ** (11-i)) 
    i += 1
  end
  max_voltage += max_joltage
end

puts  max_voltage

