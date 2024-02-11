# DP版
N = gets.to_i
A = Array.new(2) { gets.split.map(&:to_i) }
dp = Array.new(2) { Array.new(N, 0) }

dp[0][0] = A[0][0]
(0...N).to_a.each do |x|
  dp[0][x] = dp[0][x - 1] + A[0][x] unless x.zero?
  dp[1][x] = [(dp[1][x - 1] + A[1][x] unless x.zero?), dp[0][x] + A[1][x]].compact.max
end
puts dp[1][N - 1]

# 全探索版（行が2までなのでこれでも間に合う）
# N = gets.to_i
# A = 2.times.map{ gets.split(' ').map(&:to_i) }

# patterns =
#   (0..N).map do |i|
#     if i == 1
#       A[0].sum
#     else
#       A[0][0..i].sum + A[1][i..-1].sum
#     end
#   end
# puts patterns.max