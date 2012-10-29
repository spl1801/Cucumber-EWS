require 'rubygems'
require 'bundler/setup'

require 'capybara/cucumber'
require 'capybara/spec/test_app'

Capybara.app = TestApp

require 'frameworks-capybara'

class MyWorld
  TEST_PAGE_PATH ='/'

  def set_test_urls
    @test_page = @base_url + TEST_PAGE_PATH
    
  end
end

World do
  MyWorld.new
end

Before do
   set_test_urls
end
