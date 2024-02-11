require "ac-library-rb/priority_queue"

N = gets.to_i
STAGES = Array.new(N - 1) { gets.split.map(&:to_i) }

# transitions: [[ステージ, コスト], ...]
transitions = Array.new(N + 1) { [] }
STAGES.each_with_index do |(a, b, x), i|
  stage = i + 1
  transitions[stage] << [stage + 1, a] if stage < N
  transitions[stage] << [x, b]
end
dist = Array.new(N + 1, Float::INFINITY)
dist[1] = 0
pq = AcLibraryRb::PriorityQueue.new { |a, b| a[0] < b[0] }
pq.push([0, 1])
until pq.empty?
  d, u = pq.pop
  next if d > dist[u]

  transitions[u].each do |v, cost|
    if dist[u] + cost < dist[v]
      dist[v] = dist[u] + cost
      pq.push([dist[v], v])
    end
  end
end

puts dist[N]
