# 5進数は0,1,2,3,4の5種類の数字しかないので、N-1を5進数に変換してそれを2倍すると0,2,4,6,8の5種類の数字しかない場合のN番目の数字になる
# -1しているのは0をカウントするため
puts (gets.to_i - 1).to_s(5).to_i * 2

# 最初書いてたやつ
# goshinsu_list = {0 => '0', 1 => '2', 2 => '4', 3 => '6', 4 => '8'}
# result = ''
# n = N - 1
# while n > 0
#   n, mod = n.divmod(5)
#   result = goshinsu_list[mod] + result
#   binding.pry
# end
# puts result.empty? ? '0' : result