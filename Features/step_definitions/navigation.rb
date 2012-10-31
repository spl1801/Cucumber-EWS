When /^I select the link "([^"]*)"$/ do |link|
	click_on(link)
end

Then /^I am presented with the correct "([^"]*)" page$/ do |page|
	page.should have_content(page)
end

When /^I select an outbound link$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I am presented with the correct external page$/ do
  pending # express the regexp above with the code you wish you had
end