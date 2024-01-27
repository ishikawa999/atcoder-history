# 入力
N = gets.chomp.to_i
S = gets.chomp

# 'o' と 'x' のグループ化
groups = S.chars.chunk { |c| c }.to_a

# 配列 a と b の初期化
a, b = 0, 0

# 答えの計算
answer = 0
groups.each_with_index do |(char, group), index|
  group_length = group.length
  if char == 'o'
    # 'o' のグループに対しては a を増加させる
    group_length.times { |i| answer += a += 1 }
  else
    # 'x' のグループに対しては b を増加させる
    group_length.times { |i| answer += b += 1 }
  end
end

# 出力
puts answer
