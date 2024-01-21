S = gets.to_s.chomp
chunk_s = S.chars.chunk{|c| c}.to_a
if chunk_s[0][0] == 'A' && chunk_s.count == 1
  puts 'Yes'
elsif chunk_s[0][0] == 'B' && chunk_s.count == 1
  puts 'Yes'
elsif chunk_s[0][0] == 'C' && chunk_s.count == 1
  puts 'Yes'
elsif chunk_s[0][0] == 'A' && chunk_s[1][0] == 'B' && chunk_s[2][0] == 'C' && chunk_s.count == 3
  puts 'Yes'
else
  puts 'No'
end