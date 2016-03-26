puts("Hello World!")
puts "Hello World!"

#配列について
cattle = 'yahoo'
p container = [cattle, cattle]
cattle[2] = 'p'
p container

#配列の構築
a = 1
b = 'str'
c = [a, b, 3, '文字列']
d = [a, c, [1, 2, 3]]

#負の添字参照においては、後ろから参照
p c[-1]
p c[-2]
p c[-5]

#長さ付き添字参照
#位置n以降のm個の要素を含む新しい配列を生成する
p c[1, 2]
p c[1, 3]

#添字代入においては、配列は自動的に拡張され、空白部分はnilで埋まる
e = [1, 2]
e[4] = '添字代入'
p e[4]
p e[3]

#比較
arr1 = [1, 2, 'str']
arr2 = [1, 2, 'str']
arrTrue = arr1 == arr2
arrFalse = arr1 == [2, 1, 'str']
puts(arrTrue)
puts(arrFalse)

#ブロック付きメソッドとイテレータ
array = ['a', 'b', 'c']
array.each do |item|
    print item + ', '
end
array.each_with_index do |item, index|
    p [item, index]
end

#map（写像）array[n, m]　
#n文字目からm文字目を取得するらしい
acids = ['Adenin', 'Thymine', 'Guanine', 'Cytosine']
signs = acids.map{ |array| array[0, 3] }
#signsShort = acids.map{ |array| array.downcase }
#省略した書き方
signsShort = acids.map(&:downcase)
p signs
p signsShort

#ソート
array = ['73', '2', '5', '1999', '53']
#辞書式ソート
p array.sort
#数値変換後の比較ソート
p array.sort{ |x, y| x.to_i <=> y.to_i }
