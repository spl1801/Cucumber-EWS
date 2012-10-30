require 'capybara/cucumber'
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

#@driver = Selenium::WebDriver.for :firefox
#@base_url = "http://booking.expotel.com/"
   # @driver.manage.timeouts.implicit_wait = 30
   # @verification_errors = []


#################
# This is from the kketsy stuff
#################

#  browser = Selenium::WebDriver
#  browser = Selenium::WebDriver.for(:firefox)

#########################
# I've updated the variable from @browser to @driver
# This should clear the cookie
#########################
  #Before do
   # @driver = driver    
    # @driver.manage.delete_cookie "cart"
   # @driver.manage.delete_all_cookies
  #end