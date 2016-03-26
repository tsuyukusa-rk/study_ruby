#連想配列について
month_to_ordinal = {
    'Jan' => 1,
    'Feb' => 2,
    'Mar' => 3,
    'Apr' => 4,
    'May' => 5,
    'Jun' => 6,
    'Jul' => 7,
    'Aug' => 8,
    'Sep' => 9,
    'Oct' => 10,
    'Nov' => 11,
    'Dec' => 12
}
p month_to_ordinal['Aug']
p month_to_ordinal['Jun']

#JSみたいに:のバージョンも
params = {
    Jan: 1,
    Feb: 2,
    Mar: 3,
    Apr: 4,
    May: 5,
    Jun: 6,
    Jul: 7,
    Aug: 8,
    Sep: 9,
    Oct: 10,
    Nov: 11,
    Dec: 12
}
p params
p params[:Dec]

#ハッシュのメソッド
book_to_author = {
    'Ruby in Nutshell' => 'Flanagan',
    'Programming' => 'Thomas',
    'AWDwR' => 'Thomas'
}
book_to_author.each do |key, value|
    puts "#{key} by #{value}"
end
#mapはハッシュから配列を生成する
p book_to_author.map{|key, value|
    "#{key} by #{value}"
}
#Enumeratorとかいうクラスのモジュールらしい
p book_to_author.map.with_index{|(key, value), index|
    "#{index + 1}, #{key}"
}
