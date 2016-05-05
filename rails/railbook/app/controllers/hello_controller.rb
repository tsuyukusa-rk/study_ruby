# config: utf-8
# Ruby2.0以降では、デフォルトをutf-8と見なすので、マジックコメントは不要

class HelloController < ApplicationController
    def index
        #renderメソッドのtextオプションで出力
        render text: "Hello World!"
    end
end
