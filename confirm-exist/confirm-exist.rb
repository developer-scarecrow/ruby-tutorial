# フォルダを選択
Dir.chdir './test-file'

# フォルダ内の.csvファイルを削除
puts Dir.glob('*.csv').length > 0
puts Dir.glob('*.rb').length > 0
