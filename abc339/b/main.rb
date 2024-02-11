H, W, N = gets.split.map(&:to_i)
# 初期はすべて白
grids = Array.new(H) { Array.new(W, '.') }
x, y = [0, 0]
current_direction = 0
x_moves = [-1, 0, 1, 0]
y_moves = [0, 1, 0, -1]

N.times do
  # 現在いるマスが白で塗られている場合は、現在いるマスを黒に塗り替え、時計回りに90∘回転し、向いている方向に1マス進む。
  # そうでない場合は、現在いるマスを白に塗り替え、反時計回りに90∘回転し、向いている方向に1マス進む。
  if grids[x][y] == '.'
    grids[x][y] = '#'
    # +1で時計回り、-1で反時計回り それを%4で4の剰余を取ることで0, 1, 2, 3の範囲に収める(方向)
    current_direction = (current_direction + 1) % 4
  else
    grids[x][y] = '.'
    current_direction = (current_direction - 1) % 4
  end

  x = (x + x_moves[current_direction] + H) % H
  y = (y + y_moves[current_direction] + W) % W
end

grids.each do |grid|
  puts grid.join
end