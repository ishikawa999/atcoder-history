# 解説とか色々見た
def sum(a, b)
  return 0 if a < 0 || b < 0

  result = 0
  # N * Nのブロックがが欠けずに存在している部分
  result += @ruiseki[-1][-1] * (a / N) * (b / N)
  # 下にはみ出たところ
  result += @ruiseki[a % N + 1][-1] * (b / N)
  # 右にはみ出たところ
  result += @ruiseki[-1][b % N + 1] * (a / N)
  # 右下にはみ出たところ
  result += @ruiseki[a % N + 1][b % N + 1]
  result
end

N, Q = gets.chomp.split.map(&:to_i)
MAP = N.times.map { gets.chomp }

# 累積和でそれぞれのマスまでの黒マスの数を求める（@ruiseki[10, 10]の場合、左上が@ruiseki[1, 1]で右下が@ruiseki[10, 10]の範囲内の黒マスの数が格納される）
# 1からなので0は実質使わない
@ruiseki = Array.new(N + 1) { Array.new(N + 1, 0) }
1.upto(N) do |i|
  additional_black_count = 0
  1.upto(N) do |j|
    additional_black_count += 1 if MAP[i - 1][j - 1] == 'B'
    # 一つ前の累積の情報に足すことで少ない計算量で(1, 1)から(i, j)までの黒マスの数を数えられる
    @ruiseki[i][j] = @ruiseki[i - 1][j] + additional_black_count
  end
end

# 各クエリの条件をgetsで取得して、それを元に黒マスの数を求めて出力する
Q.times do
  a, b, c, d = gets.chomp.split.map(&:to_i)
  # (A,B)〜(C,D)の範囲内の黒マスを効率よく求める計算
  # 全体 - 左側 - 上側 + 左上 (左上を足しているのは、左側と上側が重複して引かれているため)
  # (1,1)〜(C,D) - (1,1)〜(C,B-1) - (1,1)〜(A-1,D) + (1,1)〜(A-1,B-1)
  puts sum(c, d) - sum(c, b - 1) - sum(a - 1, d) + sum(a - 1, b - 1)
end