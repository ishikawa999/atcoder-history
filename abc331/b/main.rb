# N個, 6, 8, 12
N, S, M, L = gets.split.map(&:to_i)

DP = Array.new(N + 13, 1 << 60)
DP[0] = 0

1.upto(N + 12) do |i|
  DP[i] = [DP[i], DP[i-6] + S].min if i >= 6
  DP[i] = [DP[i], DP[i-8] + M].min if i >= 8
  DP[i] = [DP[i], DP[i-12] + L].min if i >= 12
end
puts DP[N..-1].min
