S = gets.to_s.chomp.chars
T = gets.to_s.chomp.chars

P = %w[A B C D E]

s_diff = (P.index(S[0]) - P.index(S[1])).abs
p_diff = (P.index(T[0]) - P.index(T[1])).abs

puts [s_diff, 5 - s_diff].min == [p_diff, 5 - p_diff].min ? 'Yes' : 'No'