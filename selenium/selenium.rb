
#下記パッケージを取得
#gem install selenium-webdriver
require "selenium-webdriver"

#driverの定義(chromeのdriverなので、chromeが開く)
#別途、rubyが配置されているディレクトリに、chromeのwebdriverを配置する必要がある
driver = Selenium::WebDriver.for :chrome

#URLの遷移
driver.navigate.to "https://www.example.com"

#elementの取得および、操作のサンプル
element1 = driver.find_element(:name, 'element-attr')
element1.clear
element1.send_keys "value"

element2 = driver.find_element(:class, 'button')
element2.submit

element3 = driver.find_element(:id, 'radio')
element3.click

element4 = driver.find_element(:xpath, "//input[@value='value']")
element4.click

#ブラウザのタイトル表示
puts driver.title

#ブラウザをクローズする
driver.quit