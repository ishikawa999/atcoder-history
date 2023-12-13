# 解説を見て解く

N, L = gets.split.map(&:to_i)
K = gets.to_i
A = gets.split.map(&:to_i)

# 二分探索で、すべてのpeaceをxより大きく切ったときのpeace数がK+1個以上に切れるかを見て、K + 1個以上に切れなくなる最小を探す(num < K + 1がtrueになる位置)
# K + 1というのはpeaceの数。ようかんを1回切ったらようかんは二つになる
# 探した値から1引いたもの(K+1個以上に切れてなおかつその中で最大の大きさ)が答え
result =
  (1..L).bsearch do |x|
    num = 0  # 切れた数
    pre = 0  # 前回切ったの切れ目
    A.each do |a|
      # xを超えたら切断
      if a - pre >= x
        num += 1
        pre = a
      end
    end

    # 最後のピースがx以上なら加算
    num += 1 if L - pre >= x

    num < K + 1  # K+1個以上に切ることができる場合にtrueを返す
  end

# 探した値から1引いたもの(K+1個以上に切れてなおかつその中で最大の大きさ)が答え
puts result - 1