require 'rubygems'
require 'selenium-webdriver'
require "rspec"
include RSpec::Expectations 

driver = Selenium::WebDriver.for :firefox
driver.get "https://booking2-test.expotel.net"

element = driver.find_element(:name, 'postCode')
element.send_keys "Ch48pj"

#Shaun's bit

Selenium::WebDriver::Support::Select.new(driver.find_element(:id, "arrival_dsd")).select_by(:text, "29")
#driver.find_element(:xpath, "//td[@onclick='javascript:search()']").click

element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "cheese!" }

puts "Page title is #{driver.title}"
driver.quit