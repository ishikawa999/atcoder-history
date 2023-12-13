def variance(bags)
  mean = bags.sum.to_f / bags.size
  bags.sum { |x| (x - mean) ** 2 } / bags.size
end

def min_variance(w, d, n)
  min_var = Float::INFINITY
  # すべての組み合わせを試す
  (1...1<<n).each do |s|
    bags = Array.new(d, 0)
    n.times { |i| bags[s >> i & 1] += w[i] if s[i] == 1 }
    # 空の福袋がない場合のみ分散を計算
    min_var = [min_var, variance(bags)].min if bags.none?(&:zero?)
  end
  min_var
end

n, d = gets.split.map(&:to_i)
w = gets.split.map(&:to_i)

puts min_variance(w, d, n)
