# -*- coding: utf-8 -*-

#変数と式

def describe(name)
    #複製
    name = name.dup
    puts "This is a #{name}."
    name[2] = ?p
    puts "This is a #{name}."
end

CATTLE = "yahoo"
describe(CATTLE)
p CATTLE

#Rubyにおいては、変数宣言がない
#変数名の最初の文字を見て判断している

#ローカル変数
local = "aaa"
_local = "bbb"
#インスタンス変数
#特定のオブジェクトに属する変数、同じオブジェクトのメソッド間において共有される
@instance = "ccc"
#クラス変数
#クラスに属する変数
@@class = "ddd"
#グルーバル変数
$global = "eee"
#定数
#変更不能だけれども、アラートが出るだけで、再代入は可能
CONSTANT = "fff"
CONSTANT = "ggg"
#その他、組みこみ変数や組みこみクラスに属する定数などがある
#nil、trueなどの擬似変数には、代入不可である
#命名においては、キャメルシンタックスなどは使わず、基本的にアンダースコアを用いるべし
#しかし、クラスに関しては、PascalStyleを用いる

#ローカル変数のスコープ

#関数
def next_of(origin)
    value = origin + 1
    p value
end
def prev_of(origin)
    value = origin - 1
    p value
end
next_of(2)
prev_of(2)
#以下の二つがエラーとなる
#p value
#p undefined_value

#クラス
class Duration
    attribute_names = %w[ days hours minutes seconds ]
    p attribute_names
    attribute_names.each do |name|
        attr_accessor name
    end
end
#以下はエラーとなる
#p attribute_names

#Rubyにおいては、インクリメント・デクリメント演算子はない
#i += 1やi = i.nextとする
0.upto(9){|i| puts i}
str = "Glubbdubdrib"
str.each_byte do |byte|
    printf "%x\n", byte
end

#多重代入
#基本的に使わない
a,b,c = 1,2,3
p a
p b
p c
a, *b = 1,2,3,4,5
p b
array = [1,2,3]
a,b,c, = *array
p a
p b
p c

#論理演算子
if a == 1 && b == 2
    puts "ok"
end
if a == 1 || b == 2
    puts "ok"
end
if a != 1 || b != 2
    puts "ok"
end

#初期化イディオム
def generate_default_value
    p 'default value generated'
    return 'default value'
end
def some_method(param = nil)
    param ||= generate_default_value
end
some_method(nil)
some_method(false)
some_method(true)
some_method(0)
some_method()

#範囲演算子
for i in 0...10
    puts i
end

#条件演算子
var = a ? b : c
var = if a then b else c end

#制御式
#.ってなんだ？？
# thought = if sample.color == "green" then
#     "danger"
# else
#     "undefined"
# end
# p thought

#if文
# if condition1 then
#     do_something1
# elsif condition2 then
#     do_something2
# elsif condition3 then
#     do_something3
# else
#     do_something_other
# end
#以下のようにもかける
# do_something if condition3

#unless
condition = nil
unless condition
    puts "conditionは偽"
end
#例外状況では、以下で書いても良いかも
puts "conditionは偽" unless condition

#case式
value = 5
array = [4,5]
case value
when 1 then
    puts "1"
when 2,3 then
    puts "2,3"
when 3 then
    puts "3"
when *array
    puts "array"
else
    puts "else"
end

#範囲分岐
#正規表現も使用できる
value = 30
case value
when 0 then puts "0"
when 1..9 then puts "1けた"
when 10..99 then  puts "2けた"
end

#while
# while condition do
#     something
# end
# something while condition
# until condition do
#     something
# end

#for
for i in [1,2,3] do
    puts i
end
[1,2,3].each do |i|
    puts i
end
for name,num in [["Jan",1],["Feb",2]]
    puts "#{name}は#{num}月"
end

#イテレータ
#breakで脱出
#nextでスキップ
#redoで最初からやり直し
# loop do
#     puts "loop"
#     break if /^loop/ =~ gets
# end
3.times{puts "Yahoo"}
3.times{|i| puts i}
1.upto(3) do |i|
    next if i == 2
    puts i
end
# 1.upto(3) do |i|
#     puts i
#     redo if i == 2
# end
4.downto(1) do |i| puts i end
a = loop{break 1}
p a

#例外処理
# begin
#     do_something
# rescue ArgumentError => error then
#     puts error.message
# rescue TypeError
#     do_something2
# rescue => another_error
#     puts another_error.message
# else
#     puts "例外なし"
# ensure
#     puts "ensure節"
# end
# do_something rescue error_handling
# begin
#     process(1); process(2); process(3);
# ensure
#     puts Time.now
# end

#raise
# raise ArgumentError, "message"
# error = ArgumentError.new("message")
# raise error
#エラーメッセージなし
# raise ArgumentError
#"message"というメッセージでRuntimeError
# raise "message"
#エラーメッセージなしのRuntimeError
# raise

#大域脱出
catch(:exit) {
    loop do
        loop do
            puts "exit"
            throw :exit
        end
    end
}
