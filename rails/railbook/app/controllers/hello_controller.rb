# config: utf-8
# Ruby2.0以降では、デフォルトをutf-8と見なすので、マジックコメントは不要

# railにおいては命名規則が重要
# コントローラクラスは先頭は大文字で、接尾辞Controllerとする　ex HelloController
# コントローラクラスのファイル名は、クラス名を小文字で_でつなぐ　ex hello_controller
# その他の命名規則も同じような感じ
class HelloController < ApplicationController
    def index
        #renderメソッドのtextオプションで出力
        render text: "Hello World!"
    end
    # MVCの考えに基づいて、アクションクラスを記述
    # テンプレートさえあれば、アクションメソッドは省略可能
    def view
        # テンプレート変数として、インスタンス変数を定義する
        # アクションメソッドとビューにおいて参照可能なデータ
        @msg = "Hello World!"
        # テンプレートの参照先を任意で設定した場合(拡張子は省略可)
        # デフォルトは コントローラクラス名/アクションメソッド名
        # render "hello/special"
    end
    # レコード取得
    def list
        # モデルクラスのBookオブジェクトのallメソッドを呼び出す
        @books = Book.all
    end
    def app_var
        render text: MY_APP["logo"]["source"]
    end
end

# rake notes
# 対象ディレクトリ内から# TODO,FIXMEを探して列挙してくれる
