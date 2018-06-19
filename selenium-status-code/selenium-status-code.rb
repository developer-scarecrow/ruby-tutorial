# gem install selenium-webdriver
require "selenium-webdriver"
require 'net/http'
require 'uri'

# HTTPステータスコード
HTTP_STATUS_CODE_OK = "200"
HTTP_STATUS_CODE_BAD_REQUEST = "400"
HTTP_STATUS_CODE_NOT_FOUND = "404"
HTTP_STATUS_CODE_INTERNAL_SERVER_ERROR= "500"

#driverの定義(chromeのdriverなので、chromeが開く)
#別途、rubyが配置されているディレクトリに、chromeのwebdriverを配置する必要がある
driver = Selenium::WebDriver.for :chrome

# アクセスURL
# 200: https://www.example.com/
# 400: http://ozuma.sakura.ne.jp/httpstatus/400
# 404: https://www.example.com/hoge/
# 500: http://ozuma.sakura.ne.jp/httpstatus/500
url = "https://www.example.com/"

# status code
statusCode = Net::HTTP.get_response(URI.parse(url)).code
statusMessage = Net::HTTP.get_response(URI.parse(url)).message

# 200の場合、seleniumの処理を行う
if statusCode == HTTP_STATUS_CODE_OK then
    # http status codeを吐き出す
    puts "Status: [" + statusCode + " " + statusMessage + "]のため遷移します"
    # URLの遷移
    driver.navigate.to url
    sleep 3
else
    # http status codeを吐き出す
    puts "Status: [" + statusCode + " " + statusMessage + "]のため遷移できません"
end

#ブラウザをクローズする
driver.quit