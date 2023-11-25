# 正整数（=自然数）は、0より大きい整数のこと。つまり、1, 2, 3, 4, 5, ... のように、0を除く全ての整数を指す。
# 非負整数は、0を含む正の整数のことを指し、0, 1, 2, 3, 4, 5, ... のように、0と正整数を含む。
# Dは正整数、xとyは非負整数である。
D = gets.to_i

x = 0
min_diff = D

while x * x <= D
  # 範囲を絞るためにyの値を逆算しようとしてる
  # D - x * x ≒ y * y
  # D - x * xの平方根を切り捨てor切り上げした値がy？
  y_candidate = Math.sqrt(D - x * x)
  [y_candidate.floor, y_candidate.ceil].each do |y|
    diff = (x * x + y * y - D).abs
    min_diff = [min_diff, diff].min
  end

  x += 1
end
puts min_diff