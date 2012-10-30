Given /^that I am on the search page$/ do
  visit("http://booking.expotel.com/")
end

When /^I do not enter any information and click search$/ do
  find(:xpath, "//table[@id='searchtab']/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr/td/strong").click
end

Then /^I am presented with the appropriate error messages$/ do
  pending # This is going to be difficult because of the modal window!!!!
end

When /^I enter all valid details but a blank location and postcode$/ do
  pending # express the regexp above with the code you wish you had
end



