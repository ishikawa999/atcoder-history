A, B, D = gets.split(' ').map(&:to_i)
result = []
current = A
while current <= B
  result << current
  current += D
end
puts result