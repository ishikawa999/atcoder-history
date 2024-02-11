_n = gets.to_i
CHANGES = gets.split.map(&:to_i)

min_initial_passengers = 0
current_passengers = 0

CHANGES.each do |change|
  current_passengers += change
  if current_passengers < 0
    min_initial_passengers += -current_passengers
    current_passengers = 0
  end
end

# ずっとmin_initial_passengersを提出すべきだと間違えてた。ただしくは初期の乗客数が細小なときの最終的な乗客数
puts current_passengers
