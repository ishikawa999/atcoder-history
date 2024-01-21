def find_rotten_juice(num)
  left = 1
  right = num

  while left < right
    mid = (left + right) / 2
    puts "#{mid}人に#{mid}本ずつジュースを飲んでもらう"
    gets.chomp  # すべての人が飲み終わるまで待つ
    puts "腐ったジュースを確認しましたか？ (はい/いいえ)"
    response = gets.chomp

    if response == "はい"
      right = mid
    else
      left = mid + 1
    end
  end

  puts "腐ったジュースは#{left}本目です。"

  # 腐ったジュースを飲む友達を特定
  rotten_juice_position = left
  rotten_drinker = (rotten_juice_position - 1) / rotten_juice_position

  puts "腐ったジュースを飲む友達は#{rotten_drinker + 1}人目です。"
  puts "腐ったジュースの位置は#{rotten_juice_position}本目です。"
end

puts "ジュースの本数numを入力してください:"
num = gets.chomp.to_i

find_rotten_juice(num)
