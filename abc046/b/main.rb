N, K = gets.split(' ').map(&:to_i)

# 色の数
# Kは1回目の色を選ぶパターン（何色でもいい） * 2色目以降はK色から左で使われている1色を引く(それをN-1繰り返すためN-1乗する)
# N-1なのは、1回目だけはすでに最初で計算済みだから
puts K * ((K - 1) ** (N - 1))