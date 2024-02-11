S = gets.to_s.chomp
puts S.chars.group_by(&:itself).transform_values(&:size).sort_by{ |k, v| [-v, k] }.first[0]