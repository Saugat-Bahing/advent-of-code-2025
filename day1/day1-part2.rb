input = File.read("./input.txt")
sequence = input.split("\n");

dial_touched_zero_count = 0;
dial_position = 50;
sequence.each do |move|
  direction, value = move[0], move[1..].to_i
  step = direction == "L" ? -1 : 1;

  value.times do
    dial_position += step
    if (dial_position > 99 || dial_position < 0) then
      dial_position %= 100
    end
    if (dial_position == 0) then
      dial_touched_zero_count += 1
    end
  end
end

puts dial_touched_zero_count
