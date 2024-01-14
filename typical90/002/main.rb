N = gets.to_i

['(', ')'].repeated_permutation(N).each do |array|
  count = 0
  array.each do |bracket|
    count += 1 if bracket == '('
    count -= 1 if bracket == ')'
    break if count < 0 # countがマイナスだったら
  end
  puts array.join if count == 0
end

