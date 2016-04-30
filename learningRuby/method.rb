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
