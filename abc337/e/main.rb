# まだ解けてない

N = gets.strip.to_i

operations = []
n = N
while n > 0
  operations << n
  n /= 2
end

# 各操作回数ごとに友人に飲ませるジュースを計算
result = []
for op in operations
  juice_numbers = []
  for j in 1..N
    # ジュース番号を操作回数に基づいて選択
    if (j - 1) % op == 0
      juice_numbers << j
    end
  end
  result << juice_numbers
end
binding.pry
friends = result.size
(0...friends).each do |i|
  puts "#{result[i].length} #{result[i].join(' ')}"
end
$stdout.flush

response = gets.strip
spoiled_juice = (1..N).to_a
not_spoiled_juice = (1..N).to_a

response.chars.each.with_index do |char, i|
  if char == "1"
    spoiled_juice &= result[i]
  else
    not_spoiled_juice &= result[i]
  end
end

result_juice = (spoiled_juice - not_spoiled_juice).join(' ')
puts result_juice
$stdout.flush
