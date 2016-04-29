# -*- coding: utf-8 -*-
#マジックコメントによりエンコードを指定

#入出力

#実行コマンド時にファイル名 i i iとすると組みこみ定数ARGVで取得できる
expression = ARGV.join(' + ')
total = ARGV.inject(0){|subtotal, arg| subtotal + arg.to_i}
puts "{exression} = #{total}"

#File
File.open("./hash.rb"){|f| #ファイルを開く
    contents = f.read #ファイルの中身を全て読み込む
    print contents #ファイルをとじる
}

#File.openのモード
#r 読み取り
#w 書き込み　常に新規ファイルの作成
#r+ 読み書き両用
#w+ 読み書き両用　常に新規ファイルの作成
#a 追記専用　指定ファイルがなければ新規作成
#a+ 読み書き両用　指定ファイルがなければ新規作成
#b バイナリモード

File.open("./fileOpen/fileOpen.rb", "w"){|f|
    f.puts Time.now
}
File.open("./fileOpen/fileOpen.rb", "r"){|f|
    print f.read
}

#ビットによるモード指定
#いろいろ指定方法があるがここでは、File::WRONLY|File::CREATだけ
File.open("./fileOpen/bitMode.rb", File::WRONLY|File::CREAT){|f|
    # do somethig
}

#イテレーター
File.open("./fileOpen/fileOpen.rb"){|f|
    f.each_line do |line|
        print "#{f.lineno}: #{line}"
    end
}

#ランダムアクセス よくわからない
File.open("./fileOpen/fileOpen.rb", "r+b"){|f|
    print "#{f.pos}:\n"
    print f.gets
    print "#{f.pos}:\n"
    print f.gets
    puts bytes = f.read(3)
    f.pos = 0
    print "#{f.pos}:\n"
    print f.gets
}

#手動によるリソース管理
f = File.open("./fileOpen/fileOpen.rb")
p "手動によるリソース管理: " + f.readline
f.close

#標準入出力
p $stdin
p $stdout
p $stderr
$stderr.printf("%X\n", 0xcafe)

#ダックタイピング
#クラスの継承関係に基づかない多態性の事

#StringIO
require "stringio"
buffer = String.new
sio = StringIO.new(buffer)
$stderr = $stdout = sio
puts "untuh"
warn "outed"
$stdout = STDOUT
puts buffer

#外部エンコーディング
File.open("./fileOpen/fileOpen.rb", "r:UTF-16BE"){|f|
    print f.read.encoding
}

#内部エンコーディング
File.open("./fileOpen/fileOpen.rb", "r:UTF-16BE:utf-8"){|f|
    print f.read.encoding
}
