# Atcoder history

## accとojを使ったコンテスト参加時用のコマンド

```sh
cd atcoder-history
acc new abc000 -c all
for d in */ ; do touch "${d%/}/main.rb"; done
cd abc000/c
touch main.rb
# コードを書く
ruby main.rb
oj t -N -c "ruby main.rb" -d ./tests/
```

## デバッグ

細かいデバッグをするときは、コードの先頭に以下のコードを入れてbinding.pryで止めてデバッグする
1以外のsampleで動かしたいときは1の部分を変える

```ruby
require 'pry'
$stdin = File.open("tests/sample-1.in", "r")
```