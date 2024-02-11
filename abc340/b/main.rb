Q = gets.to_i
QUERIES = Q.times.map{ gets.split(' ').map(&:to_i) }

a = []
QUERIES.each do |query|
  if query[0] == 1
    a << query[1].to_s
  elsif query[0] == 2
    puts a[-query[1]]
  end
end