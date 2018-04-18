require 'io/console' 

#プロンプト上での入力待ち
puts "メールアドレスを入力してください。"
inputMail = gets

puts "パスワードを入力してください"
#パスワード入力時に見えなくする
inputPass = STDIN.noecho(&:gets)

puts "\n"
puts inputMail
puts inputPass