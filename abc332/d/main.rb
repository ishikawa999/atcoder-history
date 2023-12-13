
# 隣接する要素のみスワップする場合のスワップ回数を計算
def bubble_sort(array)
  exchange_count = 0

  array_size = array.size
  exchanged = true
  while exchanged
    exchanged = false
    1.upto(array_size - 1) do |i|
      next if array[i - 1] < array[i]

      exchange_count += 1
      tmp = array[i]
      array[i - 1], array[i] = array[i], array[i - 1]
      exchanged = true
    end
  end

  exchange_count
end

H, W = gets.split.map(&:to_i)
A = H.times.map { gets.split.map(&:to_i) }
B = H.times.map { gets.split.map(&:to_i) }

# 全ての値が同じでなければ不可能
unless A.flatten.sort == B.flatten.sort
  puts -1
  exit
end

row_order = B.map { |b_row| A.find_index { |a_row| a_row.sort == b_row.sort } }
col_order = B.transpose.map { |b_col| A.transpose.find_index { |a_col| a_col.sort == b_col.sort } }


puts bubble_sort(row_order) + bubble_sort(col_order)
