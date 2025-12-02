input = File.read("./input.txt")
sequence = input.split("\n");
max_dial_position = 99
dial_position = 50
zero_position_count = 0;
sequence.each do |move|
  direction = move[0] == "L" ? -1 : 1; 
  value = move[1..].to_i
  movement = direction * value
  moved_value = dial_position + movement
  dial_position = moved_value % (max_dial_position + 1)
  if (dial_position < 0 || dial_position > max_dial_position) then
    puts "something worng"
    return
  end
  if (dial_position == 0) then
    zero_position_count += 1
  end
end

puts zero_position_count
