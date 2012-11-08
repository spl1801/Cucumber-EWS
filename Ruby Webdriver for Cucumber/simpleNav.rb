require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "SimpleNav" do

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
  
  it "test_simple_nav" do
    @driver.get(@base_url + "/")
    @driver.find_element(:css, "td.footer4").click
    # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | _self | 30000]]
    @driver.find_element(:xpath, "//td[@onclick=\"javascript:winOpen('/tilesaction.do;jsessionid=null?formatname=privacypolicy','R' )\"]").click
    # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | _self | 30000]]
    @driver.find_element(:xpath, "//td[@onclick=\"javascript:winOpen('/contact.do;jsessionid=null','R' )\"]").click
    # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | _self | 30000]]
    @driver.find_element(:css, "td.whyregister").click
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
