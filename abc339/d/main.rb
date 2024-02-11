require 'set'

N = gets.to_i
GRID = Array.new(N) { gets.chomp }
DIRECTIONS = [[0, 1], [1, 0], [0, -1], [-1, 0]]
players = []

# プレイヤーの初期位置
GRID.each_with_index do |row, i|
  row.chars.each_with_index do |cell, j|
    players << [i, j] if cell == 'P'
  end
end

queue = [[players, 0]]
# すでに行ったことがあるマスを記録
visited = Set.new([players])

# 幅優先探索
while !queue.empty?
  players, operations = queue.shift
  p1, p2 = players
  # 2人のプレイヤーが同じマスにいる場合
  if p1 == p2
    puts operations
    exit
  end

  # 上下左右に移動
  DIRECTIONS.each do |x_move, y_move|
    new_p1 = [p1[0] + x_move, p1[1] + y_move]
    new_p2 = [p2[0] + x_move, p2[1] + y_move]

    # 新しい位置がグリッド内かつ移動可能な場合のみ処理
    if new_p1[0].between?(0, N - 1) && new_p1[1].between?(0, N - 1) && new_p2[0].between?(0, N - 1) && new_p2[1].between?(0, N - 1)
      # 新しい位置が訪れたことがない場合のみキューに追加
      if GRID[new_p1[0]][new_p1[1]] != '#' && GRID[new_p2[0]][new_p2[1]] != '#' && !visited.include?([new_p1, new_p2])
        visited.add([new_p1, new_p2])
        queue << [[new_p1, new_p2], operations + 1]
      end
    end
  end
end

puts -1
