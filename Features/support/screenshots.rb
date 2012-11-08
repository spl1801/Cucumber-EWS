After('@screenshot') do |scenario|
	if(scenario.failed?)
		page.driver.browser.save_screenshot("output/#{scenario.__id__}_fail.png")
		embed("#{scenario.__id__}_fail.png", "image/png", "SCREENSHOT")
	end
	if(scenario.passed?)
		page.driver.browser.save_screenshot("output/#{scenario.__id__}_pass.png")
		embed("#{scenario.__id__}_pass.png", "image/png", "SCREENSHOT")
	end
end