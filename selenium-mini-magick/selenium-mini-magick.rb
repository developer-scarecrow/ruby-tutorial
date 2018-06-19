
#下記パッケージを取得
# gem install selenium-webdriver
require "selenium-webdriver"
# gem install mini_magick
require "mini_magick"

module WebdriverUtil
	def get_screenshot (driver)
		# 表示領域の大きさ
		innerH = driver.execute_script("return document.compatMode == 'BackCompat' ? document.body.clientHeight : document.documentElement.clientHeight").to_i
		innerW = driver.execute_script("return document.compatMode == 'BackCompat' ? document.body.clientWidth : document.documentElement.clientWidth").to_i
		# コンテンツ全体の長さ
		scrollH = driver.execute_script("return document.documentElement.scrollHeight").to_i
		scrollW = driver.execute_script("return document.documentElement.scrollWidth").to_i
		# 表示領域の大きさがコンテンツ全体の長さより大きい場合
		if innerH > scrollH then
			innerH = scrollH
		end
		if innerW > scrollW then
			innerW = scrollW
		end
		# ImageMagick を使う
        # image = Magick::Image.new(scrollW,scrollH){self.background_color = "red"}
        image = MiniMagick::Image.open('input.png')
        image.resize "#{scrollW}x#{scrollH}"
        puts scrollW
        puts scrollH

		x = 0
		while x < scrollW 
			if x + innerW > scrollW then
				x = scrollW - innerW
			end
			y = 0
			while y < scrollH 
				if y + innerH > scrollH then
					y = scrollH - innerH
				end
				# スクロール位置を移動
				driver.execute_script("window.scrollTo(" + x.to_s + "," + y.to_s + ")")
				# PNG 形式でスクリーンショットを取得する
				# binary = driver.screenshot_as(:png)
				# RMagick 形式にする
				# oneImage = Magick::Image.from_blob(binary).first
				# 画像を結合
                # image.composite!(oneImage, x, y, Magick::OverCompositeOp)
                
                driver.save_screenshot('screen.png')            
                oneImage  = MiniMagick::Image.new('screen.png')
                image = image.composite(oneImage) do |c|
                    c.compose "Over"    # OverCompositeOp
                    c.geometry "+#{x}+#{y}" # copy second_image onto first_image from (20, 20)
                end
				y += innerH
			end
			x += innerW
		end
		return image
	end
	def save_screenshot (driver, filename)
		image = get_screenshot(driver)
		# ファイルに書き込む
		image.write(filename)
	end
	module_function :save_screenshot
	module_function :get_screenshot
end

#driverの定義(chromeのdriverなので、chromeが開く)
#別途、rubyが配置されているディレクトリに、chromeのwebdriverを配置する必要がある
driver = Selenium::WebDriver.for :chrome

# windowサイズの変更
driver.manage.window.resize_to(1500, 490)

#URLの遷移
driver.navigate.to "https://qiita.com/uuuno/items/ef144edd55e5e54ad6ee"
# driver.save_screenshot('screen.png')
WebdriverUtil.save_screenshot(driver, 'screen.png')

#ブラウザをクローズする
driver.quit