S = gets.to_s.chomp

if S[0] == S[0].upcase && S[1..-1] == S[1..-1].downcase
  puts 'Yes'
else
  puts 'No'
end