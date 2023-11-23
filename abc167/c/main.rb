# https://atcoder.jp/contests/abc167/tasks/abc167_c
# ビット全探索

N, M, X = gets.chomp.split.map(&:to_i)
BOOKS = N.times.map{a = gets.split.map(&:to_i); {price: a[0], scores: a[1..-1]}}
min_cost = Float::INFINITY

# ビット全探索
# [0, 1].repeated_permutation(2) => [[0, 0], [0, 1], [1, 0], [1, 1]]でbitが1のbookのscoreのみを加算することで全探索できる
[0, 1].repeated_permutation(N) do |bits|
  understanding = Array.new(M, 0)
  cost = 0

  BOOKS.zip(bits).select{|_book, bit| bit == 1}.each do |book, _bit|
    cost += book[:price]
    book[:scores].each_with_index do |score, index|
      understanding[index] += score
    end

    # 全てのアルゴリズムの理解度がX以上か
    if understanding.all? { |u| u >= X }
      min_cost = [min_cost, cost].min
    end
  end
end

puts min_cost == Float::INFINITY ? -1 : min_cost
