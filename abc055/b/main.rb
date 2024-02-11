N = gets.to_i
power = 1 # 初期値
MOD = 10 ** 9 + 7 # モジュロ演算
(1..N).each do |n|
  power *= n
  power %= MOD if power > MOD
end
puts power