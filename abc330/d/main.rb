# 以下の4つの条件を満たす3つの組の個数(例 (1,1),(1,2),(2,1)みたいな3つの組が成り立ってカウントが1つ増える )
# ・ 組に含まれる3マスは相異なる。
# ・ 3マス全てに o が書かれている。
# ・ マスのうち、丁度2つが同じ行にある。
# ・ マスのうち、丁度2つが同じ列にある。

N = gets.to_i
S = N.times.map { gets.chomp }

count = 0
rows = Array.new(N, 0)
columns = Array.new(N, 0)

# あらかじめ各行と各列にあるoの数を計算する
(0...N).each do |row|
  (0...N).each do |column|
    if S[row][column] == 'o'
      rows[row] += 1
      columns[column] += 1
    end
  end
end

(0...N).each do |row|
  (0...N).each do |column|
    if S[row][column] == 'o'
      # あらかじめ数えておいたデータをつかってその行と列にoがほかにもあるかチェック
      # 位置が隣り合っている必要はないため素直に数えておいた数から自分(1)を引けばいいはず
      # 同じ列にあるマスと同じ行にあるマスの別の組み合わせでもcountは増えるため、乗算をしてcountをふやす
      count += (rows[row] - 1) * (columns[column] - 1)
    end
  end
end

puts count
