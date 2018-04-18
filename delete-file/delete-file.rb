require "fileutils"
 
# フォルダを選択
Dir.chdir './delete-item'

# フォルダ内の.csvファイルを削除
Dir.glob('*.csv').each do |filename|
	FileUtils.rm(filename)
end
