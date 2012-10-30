require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "ModalWindow" do

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
  
  it "test_modal_window" do
    @driver.get(@base_url + "/")
    @driver.find_element(:xpath, "//table[@id='searchtab']/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr/td/strong").click
    # ERROR: Caught exception [ERROR: Unsupported command [getAlert |  | ]]
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
