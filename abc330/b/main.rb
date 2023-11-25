N, L, R = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

A.each do |ai|
  result =
    if ai < L
      "#{L} "
    elsif ai > R
      "#{R} "
    else
      "#{ai} "
    end

  puts result
end