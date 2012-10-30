require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Test" do

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
  
  it "test_" do
    @driver.get(@base_url + "/")
    @driver.find_element(:css, "option[value=\"VC\"]").click
    @driver.find_element(:name, "country").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "townCode")).select_by(:text, "Aberaeron")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "priceRange")).select_by(:text, "201-250")
    @driver.find_element(:xpath, "//table[@id='searchtab']/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr/td/strong").click
    # ERROR: Caught exception [ERROR: Unsupported command [getAlert |  | ]]
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsd")).select_by(:text, "28")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsm")).select_by(:text, "Jul")
    @driver.find_element(:xpath, "//table[@id='searchtab']/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr/td/strong").click
    # ERROR: Caught exception [ERROR: Unsupported command [getAlert |  | ]]
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsd")).select_by(:text, "30")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsm")).select_by(:text, "Nov")
    @driver.find_element(:xpath, "//table[@id='searchtab']/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr/td/strong").click
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
