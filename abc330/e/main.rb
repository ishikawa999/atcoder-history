require 'pry'
$stdin = File.open("tests/sample-1.in", "r")
N, Q = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).uniq.sort
Q.times do |q|
  expected_num = 0
  i, x = gets.split.map(&:to_i)

  # これじゃだめ。ソート前の位置の要素を消してから入れないといけない。あと、uniqする前に値を消さないと、ほかに値があるかもしれない。
  if !a.include?(x)
    a.delete_at(i - 1)
    insert_index = a.bsearch_index { |e| x < e } || a.length
    a.insert(insert_index, x)
  end

  # その後、Aのmexを出力する。
  # Aのmexとは、Aに含まれない最小の非負整数を指す。
  # 非負整数は、0を含む正の整数のことを指し、0, 1, 2, 3, 4, 5, ... のように、0と正整数を含む。
  a.each do |num|
    break if num > expected_num # Aに含まれない最小の非負整数(=mex)が見つかったらbreak
    expected_num += 1 if num == expected_num
  end
  puts expected_num
end
