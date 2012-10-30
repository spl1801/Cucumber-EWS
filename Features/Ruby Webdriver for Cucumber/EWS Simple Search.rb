require "selenium-webdriver"
require "test/unit"

class EWSSimpleSearch < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://booking.expotel.com/"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_e_w_s_simple_search
    @driver.get(@base_url + "/")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "townCode")).select_by(:text, "Chester")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "priceRange")).select_by(:text, "101-150")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsd")).select_by(:text, "25")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "arrival_dsm")).select_by(:text, "Nov")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "nights")).select_by(:text, "03")
    @driver.find_element(:id, "duponlineproductsonly").click
    @driver.find_element(:xpath, "//table[@id='searchtab']/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr/td/strong").click
    # Warning: waitForTextPresent may require manual changes
    assert !60.times{ break if (@driver.find_element(:css, "BODY").text =~ /^[\s\S]*css=td\.subheading[\s\S]*$/ rescue false); sleep 1 }
    @driver.find_element(:xpath, "//td[2]/table/tbody/tr[3]/td/table/tbody/tr/td").click
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*25\/Nov\/2012[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*3[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*1[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Chester,  United Kingdom[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*101-150  GBP[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.find_element(:xpath, "(//td[@onclick='javascript:locationmap()'])[2]").click
    @driver.find_element(:css, "a > table.actiontable1 > tbody > tr > td.action").click
    @driver.find_element(:link, "Read").click
    @driver.find_element(:css, "table.actiontable2 > tbody > tr > td.action > b").click
    # ERROR: Caught exception [ERROR: Unsupported command [getAlert |  | ]]
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "roomqty")).select_by(:text, "1")
    @driver.find_element(:css, "table.actiontable2 > tbody > tr > td.action > b").click
    @driver.find_element(:css, "table.actiontable3 > tbody > tr > td.action").click
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
end
