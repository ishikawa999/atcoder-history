H, W = gets.split(' ').map(&:to_i)
S = H.times.map { gets.chomp.to_s.chars }

# 一度黒く塗ったマスを白に戻すことはできないため、一つも黒いマスと隣り合わない黒いマスがあればNo、なければYesで良い

search_targets = [[-1, 0], [0, -1], [0, 1], [1, 0]]
H.times do |h|
  W.times do |w|
    next if S[h][w] == '.'

    any_black = false
    search_targets.each do |diff_h, diff_w|
      next if h + diff_h < 0 || h + diff_h >= H
      next if w + diff_w < 0 || w + diff_w >= W

      if S[h + diff_h][w + diff_w] == '#'
        any_black = true
        break
      end
    end
    if any_black == false
      puts 'No'
      exit
    end
  end
end

puts 'Yes'