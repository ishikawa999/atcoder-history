N, S, K = gets.split.map(&:to_i)
PQ = N.times.map { gets.split.map(&:to_i) }

sum = 0
PQ.each { |p, q| sum += p * q }
sum += K if sum < S
puts sum