N, M= gets.split.map(&:to_i)
S = gets.chomp.chars.map(&:to_i)

# Sのi文字目が0のとき、i日目に何の予定も入っていません。
# Sのi文字目が1のとき、i日目に高橋君は食事に行く予定があります。
# Sのi文字目が2のとき、i日目に高橋君は競技プログラミングのイベントに行く予定が入っています。

# 食事に行く日には、無地のTシャツ1枚またはロゴ入りのTシャツ1枚を着用する。
# 競技プログラミングのイベントに行く日にはロゴ入りのTシャツ1枚を着用する。
# 何の予定もない日にはTシャツを着用しない。加えて、その時点で着用済みのTシャツを全て洗濯する。洗濯したTシャツは翌日から着用できる。
# 一度着用したTシャツは次に洗濯するまで着用できない。

plain = M
logo = 0
max_logo = 0

S.each do |s|
  if s == 0
    plain = M
    logo = max_logo
  elsif s == 1 && plain > 0
    plain -= 1
  elsif s == 1 && logo > 0
    logo -= 1
  elsif s == 1 && logo == 0
    max_logo += 1
  elsif s == 2 && logo > 0
    logo -= 1
  elsif s == 2 && logo == 0
    max_logo += 1
  end
end
puts max_logo