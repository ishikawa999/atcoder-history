N = gets.to_i
XY = N.times.map { gets.split.map(&:to_i) }

transposed = XY.transpose
result =
  if transposed[0].sum == transposed[1].sum
    'Draw'
  elsif transposed[0].sum > transposed[1].sum
    'Takahashi'
  else
    'Aoki'
  end
puts result