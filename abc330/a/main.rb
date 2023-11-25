N, L = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

puts A.count{|a| a >= L}