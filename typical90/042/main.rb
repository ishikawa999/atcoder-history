# 解説見て実装
# 「各桁の和を足していったときの 9 で割った余りとその数字を 9 で割った余りは同じになる」という性質がある
# それを生かす
# 「0 以外の数字のみを使って」 なのもポイント

K = gets.to_i
mod = 1000000007 # 10の9乗+7で割った余りを出力してください（モジュロ演算）

if K % 9 != 0
  puts 0
  exit
end

dp = Array.new(K + 1, 0)
dp[0] = 1
# 数字の和が特定の数字になる組み合わせの数を表すdp。dp[x]には数字の和がxになる組み合わせの数が入る
# K=3の場合：
# dp[0] は1。
# dp[1] は、1のみだから1。
# dp[2] は、1+1 または 2 の2つの組み合わせがある。
# dp[3] を求めるには、dp[2], dp[1], dp[0]（和がそれぞれ2, 1, 0）にそれぞれ1, 2, 3を加えたものを考える。これにより、和が3になる組み合わせは4つ（1+1+1, 1+2, 2+1, 3）になる。
# Kが大きな数字になっても、これを適用していけば軽い計算で組み合わせの数を出せる
(1..K).each do |i|
  (i-1).downto([0, i - 9].max) do |j|
    dp[i] += dp[j]
    dp[i] %= mod if dp[i] >= mod # モジュロ演算
  end
end
# dp[K]は数字の和がKになる組み合わせの数
puts dp[K]
