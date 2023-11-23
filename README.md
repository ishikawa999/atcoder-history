# Atcoder history

## accとojを使ったコンテスト参加時用のコマンド

```sh
cd atcoder
acc new abc303 -c all
cd abc303/c
touch main.rb
# コードを書く
ruby main.rb
oj t -N -c "ruby main.rb" -d ./tests/
```

細かいデバッグをするときは、コードの先頭に以下のコードを入れてbinding.pryで止めてデバッグする
1以外のsampleで動かしたいときは1の部分を変える
```ruby
require 'pry'
$stdin = File.open("tests/sample-1.in", "r")
```