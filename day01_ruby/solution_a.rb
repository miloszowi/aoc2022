elves = Array.new

loop do
	calories = 0
	while (item_calories = (gets).to_i) and item_calories > 0
	calories += item_calories
	end
	
	break if calories == 0 else elves.append(calories)
end

print(elves.max)