N = gets.to_i
A = N.times.map{ gets.to_i }
bright_button = 1
result = 0
# 既に押したことのあるボタンをもう一度押すということはるーぷに入っているということ
# 押したボタンを蓄積しておいて、もう一度押したら終了
unless A.include?(2)
  puts '-1'
  exit
end
(N + 1).times do
  bright_button = A[bright_button-1]
  result += 1
  if bright_button == 2
    puts result
    exit
  end
end

puts '-1'