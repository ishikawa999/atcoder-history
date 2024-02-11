
# 範囲aからbまでの整数のうち、xで割り切れる数を数える問題
# aとbをxで割る。
# その商から割り切れる数を算出。
# a以上b以下の整数というようにaも含むため、a-1している

a, b, x = gets.split(' ').map(&:to_i)
puts ((b / x) rescue 0) - (((a - 1) / x) rescue 0)