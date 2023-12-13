# 繰り返す回数、グラスの容量(ml)、マグカップの容量(ml)
K, G, M = gets.split.map(&:to_i)

# グラスが水で満たされているとき、すなわちグラスにちょうど G ml 入っているとき、グラスの水をすべて捨てる。
# そうでなく、マグカップが空であるとき、マグカップを水で満たす。
# 上のいずれでもないとき、マグカップが空になるかグラスが水で満たされるまで、マグカップからグラスに水を移す。

g = 0
m = 0
K.times do
  if g == G
    g = 0
  elsif m == 0
    m = M
  else
    if (G - g) > m
      g += m
      m = 0
    else
      m -= G - g
      g = G
    end
  end
end

puts "#{g} #{m}"