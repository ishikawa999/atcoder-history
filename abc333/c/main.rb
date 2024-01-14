N = gets.to_i

# 十進法ですべての桁の数字が1である整数 => レピュニット
# とりあえず入力例3の答えを見てみると12桁なのでそれに合わせて作成してみる
repdigits = (1..12).map { |i| '1' * i }.map(&:to_i)

sums = []
repdigits.each do |a|
  repdigits.each do |b|
    repdigits.each do |c|
      sums << a + b + c
    end
  end
end
puts sums.uniq.sort[N - 1]