S = gets.chomp
T = gets.chomp

if S == T
  puts 'Yes'
  exit
end

S.each_char.with_index do |s, i|
  if T[i] == s
    next
  else
    s_copied = S.clone
    next if S[i+1].nil?

    s_copied[i] = S[i+1]
    s_copied[i+1] = S[i]
    if s_copied == T
      puts 'Yes'
      exit
    end
  end
end

puts 'No'