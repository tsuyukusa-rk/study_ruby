# -*- coding: utf-8 -*-

#メソッドについて

#メソッドチェーン
str = "&<>"
escaped_str = str.gsub(/&/, "&amp;").gsub(/</, "&lt;").gsub(/>/, "&gt;")
puts escaped_str

#レシーバの省略
#Rubyではthisではなくselfを使う
class Laputa
    def hover
        self.vibrate
        p self
    end
    def vibrate
        p "vibrate"
    end
end
#インスタンス
takalamakhan = Laputa.new
#メソッドの呼び出し
takalamakhan.hover

#関数的メソッド
#レシーバの情報を一切使用しないメソッド
def functional_method(a,b)
    return [a,b, a+b]
end
p functional_method(1,2)

#引数展開
# array = [3,4]
# some_method(1,2,*array)

#メソッド定義 def
def sum(x,y)
    x + y
end
def diff x,y
    x - y
end
def prod(x,y) x * y end
def quo x,y; x / y end
puts sum(1,2)
puts diff(1,2)
puts prod(1,2)
puts quo(1,2)

#return
def fact(n)
    # nが0の場合は打ち切って、1を返す
    return 1 if n == 1
    product = 1
    (1..n).each do |i|
        product *= i
    end
    return product
end
p "return"
p fact(0)
p fact(3)
def returnArray(a)
    [a, 1, 2, 3]
end
p returnArray(2)

#引数のデフォルト値
# Cは省略可。
def defaultMethod(a, b, c = 1)
    return c
end
def print_time(time = Time.now)
    p time
end
print_time
sleep 1
print_time

#可変長引数
def stretch_val(a, b, *c)
    p [a, b, c]
end
stretch_val(1, 2, 3, 4, 5)

#ブロック付きメソッド
verse = "sample\nsample\n"
count = 0
verse.each_line do |line|
    print line
    count += 1
end
def foo_bar_baz
    yield "foo"
    yield "bar"
    yield "baz"
end
foo_bar_baz do |item|
    puts item
end

def foo_bar_baz3
    # ブロックを与えられていない時、enum_forでEnumeratorを生成して返す
    # block_given?は現在のメソッド呼び出しに対するブロックの有無をreturn
    return enum_for(:foo_bar_baz3) unless block_given?
    %w[foo bar baz].each do |item|
        yield item
    end
end

def my_map
    [yield(1), yield(2), yield(3)]
end
p my_map{|i| i+1}

#クロージャ

#環境の保存
#ライブラリの記述などにも用いられる
#Proc.new
def create_counter()
    count = 1
    return Proc.new do
        count += 1
        p count
    end
end
counter = create_counter()
p counter.class
counter.call
counter.call
counter2 = create_counter()
counter2.call

#Proc
#Procオブジェクトは、コードブロックをオブジェクトとしてみた時の名前
class SleepyPerson
    def register_handler(&handler)
        @event_handler = handler
    end
    def wake_up!
        @event_handler.call Time.now, "woke up"
    end
end
john = SleepyPerson.new
john.register_handler{|time, message| p [time, message]}
john.wake_up!
proc = Proc.new{puts "Proc was called"}
3.times(&proc)
