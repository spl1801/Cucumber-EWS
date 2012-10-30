require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "SimpleSearch" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://booking.expotel.com/"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_simple_search" do
    @driver.get(@base_url + "/")
    @driver.find_element(:css, "option[value=\"KN\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "country")).select_by(:text, "Syria")
    @driver.find_element(:css, "option[value=\"SY\"]").click
    @driver.find_element(:name, "country").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "country")).select_by(:text, "United Kingdom")
    @driver.find_element(:css, "option[value=\"GB\"]").click
    @driver.find_element(:name, "postCode").clear
    @driver.find_element(:name, "postCode").send_keys "ch1 4hz"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "priceRange")).select_by(:text, "101-150")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsd")).select_by(:text, "24")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsm")).select_by(:text, "Nov")
    @driver.find_element(:xpath, "//table[@id='searchtab']/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr/td/strong").click
    # Warning: verifyTextPresent may require manual changes
    verify { @driver.find_element(:css, "BODY").text.should =~ /^[\s\S]*107\.10[\s\S]*$/ }
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
