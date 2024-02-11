N = gets.to_i
S = gets.chomp.chars

W = Array.new(N, 0)
E = Array.new(N, 0)

# 累積和を計算する
S.each_with_index do |s, i|
  W[i] = i > 0 ? W[i-1] : 0
  E[i] = i > 0 ? E[i-1] : 0
  W[i] += 1 if s == 'W'
  E[i] += 1 if s == 'E'
end

cost = Float::INFINITY
(0...N).each do |i|
  # リーダーより左にいて西（W）を見ている人 + リーダーより右にいて東（E）を見ている人 を変更する必要がある
  new_cost = (i > 0 ? W[i-1] : 0) + (E[-1] - E[i])
  cost = [cost, new_cost].min
end

puts cost
