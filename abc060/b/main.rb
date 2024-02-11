A, B, C = gets.split(' ').map(&:to_i)

# A * Bまでの間にあまりのパターンは出きっており、これ以降は繰り返しになる
# そのため、あり得る数字をすべて探索しなくてもA〜A * Bまでの間を見るだけであまりがCになるパターンが存在するかはわかる
(A..(A * B)).each do |n|
  if n % A == 0 && n % B == C
    puts 'YES'
    exit
  end
end
puts 'NO'