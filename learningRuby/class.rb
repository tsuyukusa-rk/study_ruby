# -*- coding: utf-8 -*-

#オブジェクトとクラス

#任意のクラスを定義
class Duration
    1 + 1
end

#継承
#複数のクラスを継承するすることはできない
#変更不能なクラスのサブクラスが変更可能なのは良くない
# class Duration < Range
# end

#インスタンスメソッド
class Duration
    def display; puts self end
end
duration = Duration.new
duration.display

#クラスメソッド
#staticメソッドのことである
#クラス名を付与するか、selfとする
class Duration
    # def Duration.print(x); p x end
    def self.print(x); p x end
end
Duration.print(1)

#initialize
#コンストラクタに当たるもの
class Duration
    def initialize(since, till)
        # @から始まるのはインスタンス変数
        @since = since
        @until = till
    end
    # 属性へのgetterとsetterを定義する
    # @sinceや@untilへの参照を定義できる
    # duration.untilのようにアクセス可になる
    attr_accessor :since, :until
end
duration = Duration.new(Time.now, Time.now + 3600)
p duration.until
# 代入も可
p duration.since = Time.now

#スーパークラスの呼び出し
class Duration
    def display(target=$>)
        # super(target)と同意
        super
        target.write "(#{self.since}-#{self.until})"
    end
end
p duration.display

#クラス変数
class Foo
    @@class_variable = "foo"
    def print
        p @@class_variable
    end
end
class Bar < Foo
    p @@class_variable
    @@class_variable = "bar"
    def print
        p @@class_variable
    end
end
foo = Foo.new
foo.print
bar = Bar.new
bar.print

#アクセス権限
#public,protected,privateの三つ
# class Yahoo
#     # デフォルトではメソッドは、publicになる
#     def public_method; end
#     # 以降定義するメソッドは自動的に、privateになる
#     private
#     def internal_use; end
#     def public_api
#         return internal_use
#     end
#     # public_apiをpublicに
#     public public_api
# end
# yahoo = Yahoo.new
# yahoo.public_api
# # アクセスエラーとなる
# yahoo.internal_use

#特異メソッド
#シングルトンパターンの代替
message = "Hello"
def message.build_greeting(target)
    "#{self}, #{target}"
end
p message.build_greeting("world")

#メタクラス
#Classオブジェクトの特異クラスがメタクラス
#特異メソッドと特異クラスは概念上ほぼ同一
class Duration
    class << self
        def a_week_from(from)
            return self.new(from, from+7*24*60*60)
        end
    end
end
p Duration.a_week_from(Time.now)

#モジュール

#Mix-in
#基本的にモジュールはインクルードして使う
#モジュールはインスタンス不可
def < (rhs)
    result = self.<=>(rhs)
    return result < 0
end
def <= (rhs)
    result = self.<=>(rhs)
    return result <= 0
end
class Foo
    include Comparable
    def <=> (rhs)
        p rhs
    end
end
foo1 = Foo.new
foo2 = Foo.new
foo1 <=> foo2

#名前空間
class Service; p "Service" end
module Library
    class Service; p "Library::Service" end
end
p Service
p Library::Service
