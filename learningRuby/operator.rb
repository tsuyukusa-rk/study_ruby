#数値演算
#0x,0X → 16進数
#0d,0Dまたはなし → 10進数
#0o,0O → 8進数
#0b,0B → 2進数

#数値演算
p 10 + 7
p 5.25 - 7
p 4 * 5
p 3 ** 5

#除算
p 7 / 2
p 7 % 2
p 7.0 / 2
# p 7 / 0　エラーとなる
p 7.0 / 0

#符号操作
a = -3.0
p -a
p +a

#割り算を剰余とセットで、返す
p -7.divmod(2)

#絶対値
p -3.1416.abs

#少数部繰り上げ
p 0.5772.ceil

#型変換
p 1 + '2'.to_i
p 7.to_f / 2

#宇宙船演算子
p 1 <=> 2
p 2 <=> 2
p 3 <=> 2

#ソート
p [6, 7, 2, 3, 7].sort

#数学関数
include Math
p E
p PI
p cos(0)
p log10(2)

#ビット演算
a = 0b1100
b = 0b1010
#積
p a & b
#和
p a | b
#排他的ビット和
p a ^ b
#ビット反転
p ~a
#シフト
p a << 1
p a >> 1
p a << -1
#ビット位置へのアクセス
p a[0]
p a[2]
#ビット位置への代入はできない

0.upto(100) do |i|
    print 3[i]
end
puts #改行
0.upto(100) do |i|
    print -3[i]
end
puts #改行
