N = gets.to_i
A = gets.split.map(&:to_i)

result = Array.new(N)
list = Hash.new

sento = A.index(-1) + 1
result[0] = sento
A.each.with_index do |a, i|
  list[a] = (i + 1) if a != -1
end
(1...N).to_a.each do |i|
  result[i] = list[result[i - 1]]
end
puts result.join(' ')