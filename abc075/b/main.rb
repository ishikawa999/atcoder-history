H, W = gets.chomp.split.map(&:to_i)
S = H.times.map { gets.chomp.chars }

search_targets = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1,-1], [1, 0], [1, 1]]
result = S.clone
(0..H-1).each do |y|
  (0..W-1).each do |x|
    next if S[y][x] == '#'

    count = 0
    search_targets.each do |diff_y, diff_x|
      next if (y + diff_y) < 0 || (y + diff_y) >= H
      next if (x + diff_x) < 0 || (x + diff_x) >= W

      count += 1 if S[y+diff_y][x+diff_x] == '#'
    end
    result[y][x] = count
  end
end
puts result.map{|r| r.join('')}.join("\n")