require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Navigation" do

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
  
  it "test_navigation" do
    @driver.get(@base_url + "/")
    @driver.find_element(:link, "Hotels").click
    @driver.find_element(:link, "Bookers Toolkit").click
    @driver.find_element(:link, "M.I.C.E.").click
    @driver.find_element(:link, "Exhibitions").click
    @driver.find_element(:link, "FAQ").click
    @driver.find_element(:link, "Expotel.com").click
    @driver.find_element(:css, "td.whyregister").click
    @driver.find_element(:css, "td.footer4").click
    # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | _self | 30000]]
    @driver.find_element(:xpath, "//td[@onclick=\"javascript:winOpen('/tilesaction.do;jsessionid=41BCA8AC109A4F1229BD2D48180C3A91.ews-booking?formatname=privacypolicy','R' )\"]").click
    # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | _self | 30000]]
    @driver.find_element(:xpath, "//td[@onclick=\"javascript:winOpen('/contact.do;jsessionid=41BCA8AC109A4F1229BD2D48180C3A91.ews-booking','R' )\"]").click
    # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | _self | 30000]]
    @driver.find_element(:link, "exact:Forgotten password?").click
    @driver.find_element(:link, "Register Now").click
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
