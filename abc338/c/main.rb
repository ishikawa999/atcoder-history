def max_meals(n, q, a, b)
  # 各材料で作れる料理Aと料理Bの最大人数を計算
  max_meals_a = Array.new(n) { |i| a[i] != 0 ? q[i] / a[i] : 0 }
  max_meals_b = Array.new(n) { |i| b[i] != 0 ? q[i] / b[i] : 0 }

  # 全ての組み合わせを試して、最大人数を見つける
  max_total_meals = 0
  (0..max_meals_a.min).each do |meals_a|
    (0..max_meals_b.min).each do |meals_b|
      if (0...n).all? { |i| q[i] >= a[i] * meals_a + b[i] * meals_b }
        max_total_meals = [max_total_meals, meals_a + meals_b].max
      end
    end
  end

  max_total_meals
end

# 入力例
n = gets.to_i
q = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

# 出力
puts max_meals(n, q, a, b)
