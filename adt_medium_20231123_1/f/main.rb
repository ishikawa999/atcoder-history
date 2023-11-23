X, A, D, N = gets.chomp.split.map(&:to_i)

sequence = []
current_term = A
N.times do
  sequence << current_term
  current_term += D
end

candidate = sequence.min_by{|x| (x-X).abs}
puts (X - candidate).abs

# 素直に解くだけでは時間が足りない