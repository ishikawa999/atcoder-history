# たぶんTLE
n = gets.to_i
q = gets.split(' ').map(&:to_i)
a = gets.split(' ').map(&:to_i)
b = gets.split(' ').map(&:to_i)

max_total_meals = 0

for a_meals in 0..q.max
  for b_meals in 0..q.max
    valid_combination = true
    n.times do |i|
      required_a = a[i] * a_meals
      required_b = b[i] * b_meals
      if required_a + required_b > q[i]
        valid_combination = false
        break
      end
    end
    if valid_combination
      max_total_meals = [max_total_meals, a_meals + b_meals].max
    end
  end
end

puts max_total_meals
