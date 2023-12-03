N = gets.to_i
A = gets.split.map(&:to_i)

# 一回一回計算すると時間がかかるためたぶん累積和
sorted_a = A.sort

sums = []
sorted_a.reverse.each do |num|
  # 各要素から数列の末尾までの和を逆順に計算
  sums << num + (sums.last || 0)
end
sums = sums.reverse

# Aの要素のうちAiより大きな要素全ての和を求めよ。
result = A.map do |num|
  # numより大きい最初の要素の位置を二分探索し、末尾までの和をsumsから取得
  idx = sorted_a.bsearch_index { |x| x > num } || N
  sums[idx] || 0
end

puts result.join(' ')
