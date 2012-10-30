require 'capybara/cucumber'
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

@driver = Selenium::WebDriver.for :firefox
@base_url = "http://booking.expotel.com/"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []



