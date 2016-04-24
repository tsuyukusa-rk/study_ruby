# -*- coding: utf-8 -*-
#マジックコメントによりエンコードを指定

#文字列
#rubyでは基本的にダブルクォーテションで書いた方が良いかも
#バックスラッシュはシングルの場合では、機能しないらしい
#リテラル
p "Hello"
p "日本語"
p 'single quoted'
p '改行
を含む文字列'

#バックスラッシュ
#\Zのような解釈できないバックスラッシュ記法はZとして解釈される
p "\n"
p "\007"
p "\x1B"
p "\Z"

#unicode文字
p "\u2318"
p "\u{3042 3044 3046}"

#文字列化
a = 1
p a
p a.to_s

#バッククォート文字列
#シェルコマンドの実行
p `date`
p `pwd`

#%記法
#可読性の向上に用いる
p %q[中に"が含まれる文字列]
p %Q[中に'が含まれる文字列]

#ヒアドキュメント
# count = database_connector.get_int(<<"EOS" % author.id)
#     SELECT COUNT(*)
#     FROM   book
#     WHERE  book.author_id = %d
# EOS
# p count
count = <<"EOS"
    aaaaa
    bbbb   bbbb
EOS
p count
#<<-とすると区切り後の前にインデントを入れることができるようになる
p <<-"EOS"
    aaaaa
    aaaaaaaa
    EOS

#文字リテラル
p ?1
p ?a
p ?\d
p ?\M-\C-d
p ?\u2318
p ?あ

#正規表現
#$1は組みこみ変数
str = "<a href=\"abcd\"></a>"
if /<a href="(.*?)"[ >]/ =~ str
    puts $1 + "へのリンクを発見"
end

#部分文字列へのアクセス
story = <<-EOS
    Solomon Grundy,
    BORN on Monday,
    Christened on Tuesday
EOS
p story[0], story[1], story[2]
p story[-1], story[-2], story[-3]
p story[200]
p story[8, 6]
p story[8...14]
p story["Monday"]
p story[/\w+sday/]

# 置換
p story["Monday"] = "aaaa"
p story2 = story.gsub(/\w+sday/, "aaaa")

#結合
#エンコードが違う場合は結合不可
p "str" + "ing"

#反復
p "Look!" * 3

#分解
p splitStr = "a, bb, ccc, dddd"
p splitStr = splitStr.split(/,\s?/)

#空の正規表現で1文字ずつに分解できる
p "string".split(//)

#逆にする
p "string".reverse

#空白の削除
p "\n \rstring  ".strip

#長さ
p "string".length

#イテレータ
"str".each_byte do |byte|
    p byte
end
story.each_line do |line|
    print line
end

#フォーマット
#%[引数][フラグ][幅][.精度]指示子
p sprintf("%04d", 3)
p "%04d" % 3

#シンボルリテラル
p :"Anna Terras"
#シンボルと文字列の違いは
#シンボルは内容が同じであれば必ず同値の判定ができる
#シンボルは変更不能である
#Ruby on Railsではハッシュのキーとして利用されている

#エンコード
#エンコードがちがう場合には、文字列としての同値性はない
p Encoding.name_list
p Encoding.find("CP1258")

#コード変換
utf = "日本"
p utf.encoding
sjis = utf.encode("Shift_JIS")
p sjis.encoding
