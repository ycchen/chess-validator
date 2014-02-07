
def load_position
	sp_file = File.new("simple_board.txt", "r")
	@board = sp_file.each_line.map(&:split)

	sp_file.close 

	@game ={}
	(1..8).to_a.reverse.each_with_index do |rank,i|
		("a".."h").each_with_index do |d,j|
			# game["#{d}#{rank}"] = "#{i}#{d}#{rank}#{j}"
			@game["#{d}#{rank}"] = "#{@board[i][j]}"
		end
	end

end

def load_moves
	sm_file = File.new("simple_moves.txt", "r")

	@moves = sm_file.each_line.map(&:split)

	sm_file.close

	@moves.each do |key, value|
		check_move(key, value)
	end
end

def check_move(move_from, move_to)
	role = @game[move_from]
	puts case role[1,1]
		when "P"
			pawn(role, move_from, move_to)
		when "N" 
			knight(role, move_from, move_to)
		when "Q" 
			"Call Queen's move"
		when "K" 
			"Call King's move"	
		when "B" 
			"Call Bishop's move"
		when "R" 
			"Call Rook's move"		
		when "--"
			"#{role} ILLEGAL"
		else
			"#{role} ILLEGAL"
	end

end

def knight(role, move_from, move_to)
	f_steps = move_from[1,1].to_i
	t_steps = move_to[1,1].to_i
	org_col = move_from[0,1].ord.to_i
	to_col  = move_to[0,1]
	allow_col = [(org_col+1).chr, (org_col-1).chr]
	
	case role[0,1]
		when "w"
			move_steps = t_steps - f_steps
		when "b"
			move_steps = f_steps - t_steps
		else
			 "Empty space!"
	end	

	if move_steps == 2 && allow_col.include?(to_col)
	 	"#{role} wants to move from #{move_from} to #{move_to} - LEGAL"
	else
		"#{role} wants to move from #{move_from} to #{move_to} - ILLEGAL"
	end
end

def pawn(role, move_from, move_to)
	move_steps = move_to[1,1].to_i - move_from[1,1].to_i

	case role[0,1]
		when "w"
			 move_steps = move_to[1,1].to_i - move_from[1,1].to_i

		when "b"
			 move_steps = move_from[1,1].to_i - move_to[1,1].to_i
		else
			 "Empty space!"
	end	

	move_col = move_to[0,1] == move_from[0.1] ? true : false 
	if move_steps <= 2 && move_col
		"#{role} wants to move from #{move_from} to #{move_to} - LEGAL"
	else
		"#{role} wants to move from #{move_from} to #{move_to} - ILLEGAL"
	end

end

load_position
load_moves

