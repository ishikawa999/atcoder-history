nishinsu = gets.to_i.to_s(2) 
puts nishinsu.reverse.chars.find_index{|c| c == "1"}
