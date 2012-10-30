require "rubygems" #Shaun possibly to remove
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations 

describe "EWSBooking" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://booking2-test.expotel.net/"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_e_w_s_booking" do
    @driver.get(@base_url + "/accomSearchPage.do?world&pre=no")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "townCode")).select_by(:text, "Aberdeen")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsd")).select_by(:text, "29")
    @driver.find_element(:xpath, "//td[@onclick='javascript:search()']").click
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    @driver.find_element(:xpath, "//tr[5]/td[5]/table/tbody/tr/td[2]/a/table/tbody/tr/td").click
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "roomqty")).select_by(:text, "1")
    @driver.find_element(:xpath, "//tr[3]/td[3]/table/tbody/tr/td/b").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "salutation")).select_by(:text, "Mr")
    @driver.find_element(:name, "booker_firstname").clear
    @driver.find_element(:name, "booker_firstname").send_keys "test"
    @driver.find_element(:name, "booker_lastname").clear
    @driver.find_element(:name, "booker_lastname").send_keys "tester"
    @driver.find_element(:name, "booker_add1").clear
    @driver.find_element(:name, "booker_add1").send_keys "test1"
    @driver.find_element(:name, "booker_telno").clear
    @driver.find_element(:name, "booker_telno").send_keys "1234"
    @driver.find_element(:name, "booker_town").clear
    @driver.find_element(:name, "booker_town").send_keys "testtt"
    @driver.find_element(:name, "email").clear
    @driver.find_element(:name, "email").send_keys "testing@expotel.com"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "guesttitle0")).select_by(:text, "Mr")
    @driver.find_element(:name, "guestfirst0").clear
    @driver.find_element(:name, "guestfirst0").send_keys "test"
    @driver.find_element(:name, "guestlast0").clear
    @driver.find_element(:name, "guestlast0").send_keys "tester"
    @driver.find_element(:name, "nameincard").clear
    @driver.find_element(:name, "nameincard").send_keys "tester"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "cardtype")).select_by(:text, "Switch")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "expmonth")).select_by(:text, "Jan")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "expyear")).select_by(:text, "2015")
    @driver.find_element(:name, "cardCvvNo").clear
    @driver.find_element(:name, "cardCvvNo").send_keys "123"
    @driver.find_element(:name, "cardno").clear
    @driver.find_element(:name, "cardno").send_keys "6759123412341234"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "issmonth")).select_by(:text, "Jan")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "issyear")).select_by(:text, "2010")
    @driver.find_element(:name, "acceptterms").click
    @driver.find_element(:css, "td.action > b").click
    # ERROR: Caught exception [ERROR: Unsupported command [chooseCancelOnNextConfirmation]]
    @driver.find_element(:css, "table.actiontable2 > tbody > tr > td.action > b").click
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [getConfirmation]]
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
