# スキャッフォールド機能はそれ自体のコメンド
# ails generate scaffold book isbn:string title:string price:integer publish:string published:date cd:boolean
# の他にマイグレーションは実行する必要がある
# rake db:migrate
class Book < ActiveRecord::Base
end
