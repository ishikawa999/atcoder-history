M, D = gets.split.map(&:to_i)
y, m, d = gets.split.map(&:to_i)

if d == D
  if m == M
    puts "#{y + 1} 1 1"
  else
    puts "#{y} #{m + 1} 1"
  end
else
  puts "#{y} #{m} #{d + 1}"
end