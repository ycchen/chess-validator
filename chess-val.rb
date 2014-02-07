

sp_file = File.new("simple_board.txt", "r")

# @board = sp_file.each_line.map(&:split)

# @board = Hash.new

# @board = sp_file.each_line.map(&:split)

# sp_file.close 

# @board.each do |key, value|
# 	puts "key #{key} = #{value}"
# end	

@board.each_with_index do |item, i|
	# puts "#{i} = #{item}"
	item.each_with_index do |data, j|
		puts "@board[#{i}][#{j}] = #{@board[i][j]}"
	end
end
	# puts @board.inspect
	# puts @board[0][0]
game ={}
(1..8).to_a.reverse.each do |rank|
	("a".."h").each do |d|
		game["#{d}#{rank}"] = "#{d}#{rank}"
	end
end

# squares = ("a".."h").map do |l|
# 	(1..8).to_a.reverse.map{|rank| "#{l}#{rank}"}
# end
# puts squares


puts game

game.each do |key, value|
	puts "key #{key} = #{value}"
end

# sm_counter =1
sm_file = File.new("simple_moves.txt", "r")
hash_sm_file = File.new("simple_moves.txt", "r")

while (line = sm_file.gets)
	puts line
end

@moves = hash_sm_file.each_line.map(&:split)

sm_file.close
hash_sm_file.close

puts ''

@moves.each_with_index do |item, i|
	# puts "#{i} = #{item}"
	item.each_with_index do |data, j|
		puts "@moves[#{i}][#{j}] = #{@moves[i][j]}"
	end
end

