N = gets.to_i

['(', ')'].repeated_permutation(N).each do |pattern|
  count = 0
  pattern.each do |p|
    count += 1 if p == '('
    count -= 1 if p == ')'
    break if count < 0
  end
  puts pattern.join if count == 0
end