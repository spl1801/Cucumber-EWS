When /^I select the link "([^"]*)"$/ do |link|
	click_on(link)
end

 When /^I follow the link "([^"]*)"$/ do |link|
	if link == "link" then
		steps('I follow the link '+ link)
	end
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

When /^I follow the link Privacy Policy$/ do |link|
	find_element(:xpath, "//td[@onclick=\"javascript:winOpen('/tilesaction.do;jsessionid=null?formatname=privacypolicy','R' )\"]").click
end

When /^I follow the link Terms \%& Conditions$/ do |link|
	find_element(:css, "td.footer4").click
end

When /^I follow the link Contact Us$/ do |link|
	find_element(:xpath, "//td[@onclick=\"javascript:winOpen('/contact.do;jsessionid=null','R' )\"]").click
end

When /^I follow the link Why Register$/ do |link|
	find_element(:css, "td.whyregister").click
end