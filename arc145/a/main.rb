# https://atcoder.jp/contests/arc145/tasks/arc145_a
# 回文を作る

N = gets.to_i
S = gets.chomp

if S[0] == 'A'
  puts 'No'
elsif S[-1] == 'B'
  puts 'No'
elsif N == 2
  puts 'No'
else
  puts 'Yes'
end