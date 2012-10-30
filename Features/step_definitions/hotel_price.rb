Given /^I am on the EWS Search page$/ do
  visit("http://booking.expotel.com")
end

Given /^I have entered a price "(.*?)"$/ do |arg1|
	find_element(:css, "option[value=\"KN\"]").click
    find_element(:name, "country").select_by(:text, "Syria")
    find_element(:css, "option[value=\"SY\"]").click
    find_element(:name, "country").click
    find_element(:name, "country").select_by(:text, "United Kingdom")
    find_element(:css, "option[value=\"GB\"]").click
    find_element(:name, "postCode").clear
    find_element(:name, "postCode").send_keys "ch1 4hz"
    find_element(:name, "priceRange").select_by(:text, "101-150")
    find_element(:id, "arrival_dsd").select_by(:text, "24")
    find_element(:id, "arrival_dsm").select_by(:text, "Nov")
 end

When /^I click Search$/ do
  find(:xpath, "//table[@id='searchtab']/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr/td/strong").click
end

Then /^I am presented with an appropriate list of hotels in the correct price range "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

