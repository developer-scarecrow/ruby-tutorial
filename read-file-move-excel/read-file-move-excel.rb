require 'csv'
require 'win32ole'

Encoding.default_external = 'UTF-8'

# エクセルの定義
excel = WIN32OLE.new('Excel.Application')

#エクセルの表示非表示制御
excel.visible = false

#開く対象のエクセルファイル
sxlsfile = __dir__.encode("utf-8") + "/write-excel/write-excel.xlsx"

#例外処理
begin
   workbook = excel.workbooks.Open(sxlsfile)
rescue
   puts "excelファイル読み込みエラー!"
   exit
end

# シート名: write
sheet = workbook.sheets('write')
sheet.Activate

i = 1
filename = './sample-read-text/sample-read-text.csv'
CSV.foreach(filename, headers: true) do |data|
    if i == 1 then
        puts data
        cellData = data.split(",")
        puts cellData
        # rowData.each do | cellData |
        #     puts cellData
        # end
    end
    i = i + 1
end
