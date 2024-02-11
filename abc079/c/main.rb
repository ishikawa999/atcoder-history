A, B, C, D = gets.to_s.chomp.chars.map(&:to_i)

# A + B + C + D のような式の時、3つの + か - の演算子が使える
# どの組み合わせなら結果が7になるか計算して計算式を出力する

# - を -1, + を 1 としてbit全探索
[-1, 1].repeated_permutation(3) do |bits|
  if (A + (B * bits[0]) + (C * bits[1]) + (D * bits[2])) == 7
    puts "#{A}#{bits[0] == 1 ? '+' : '-'}#{B}#{bits[1] == 1 ? '+' : '-'}#{C}#{bits[2] == 1 ? '+' : '-'}#{D}=7"
    exit
  end
end