N, M, L = gets.split.map(&:to_i)
main_dishes = gets.split.map(&:to_i)
side_dishes = gets.split.map(&:to_i)

# 組み合わせられない定食を記録するハッシュを初期化
invalid_combi = Hash.new(false)
L.times do
  c, d = gets.split.map(&:to_i)
  invalid_combi[[c, d]] = true
end

# 主菜と副菜の価格リストを降順にソート
# (価格と元のインデックスのペア)
sorted_main = main_dishes.each_with_index.sort{|x,y| y[0] <=> x[0]}
sorted_side = side_dishes.each_with_index.sort{|x,y| y[0] <=> x[0]}

# 最高価格の組み合わせを探す
max_price = 0
sorted_main.each do |main_price, main_idx|
  sorted_side.each do |side_price, side_idx|
    # 組み合わせが無効であれば次へ
    next if invalid_combi[[main_idx + 1, side_idx + 1]]

    # 価格を計算して最高価格を更新
    price = main_price + side_price
    max_price = [max_price, price].max

    # 有効な組み合わせを見つけたら内側のループ終了
    break
  end
end

# 最高価格を出力
puts max_price
