# 解説のコードを参考に
# 入力
N = gets.to_i
S = gets.chomp

# 初期化
mod = 1000000007
dp = Array.new(S.size + 1) { Array.new(8, 0) }
dp[0][0] = 1 # 初期状態を設定。何も選ばない（0個の文字を選ぶ）場合の数を1にする

# 動的計画法 (DP)
S.size.times do |i| # 文字列の各文字に対して
  8.times do |j| # 'atcoder' の各文字に対して(0がいるのでatcoderの文字数+1)
    dp[i + 1][j] += dp[i][j]
    dp[i + 1][j] %= mod

    # 文字列 'atcoder' の各文字に対して条件分岐
    case S[i]
    when 'a'
      dp[i + 1][j + 1] += dp[i][j] if j == 0 # 'a' が見つかった場合
    when 't'
      dp[i + 1][j + 1] += dp[i][j] if j == 1 # 't' が見つかった場合
    when 'c'
      dp[i + 1][j + 1] += dp[i][j] if j == 2 # 'c' が見つかった場合
    when 'o'
      dp[i + 1][j + 1] += dp[i][j] if j == 3 # 'o' が見つかった場合
    when 'd'
      dp[i + 1][j + 1] += dp[i][j] if j == 4 # 'd' が見つかった場合
    when 'e'
      dp[i + 1][j + 1] += dp[i][j] if j == 5 # 'e' が見つかった場合
    when 'r'
      dp[i + 1][j + 1] += dp[i][j] if j == 6 # 'r' が見つかった場合
    end

    dp[i + 1][j + 1] %= mod if 'atcoder'.include?(S[i]) && j < 7
  end
end

puts dp[-1][-1] # 最終的な答えを出力
