# coding: utf-8
# excelのマクロ実行例
require 'win32ole'

excel = WIN32OLE.new('Excel.Application')

#エクセルの表示非表示制御
excel.visible = true

#開く対象のエクセルファイル
sxlsfile = __dir__.encode("utf-8") + "/test_macro.xlsm"

#例外処理
begin
   workbook = excel.workbooks.Open(sxlsfile)
rescue
   puts "excelファイル読み込みエラー!"
   exit
end

# 引数なし
excel.Run("helloWorld")

# 引数文字列
excel.Run("helloRuby", "rubyからExcelマクロ実行")

excel.quit