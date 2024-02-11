# メモ化再帰
N = gets.to_i
@memo = {}

def calc_cost(x)
  return 0 if x < 2
  return @memo[x] if @memo.has_key?(x)
  @memo[x] = calc_cost(x / 2) + calc_cost((x + 1) / 2) + x
end

puts calc_cost(N)