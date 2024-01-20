N = gets.to_i
count = 0
(1..N).each do |i|
  count += 1 if i % i.to_s.chars.map(&:to_i).sum == 0
end
puts count
