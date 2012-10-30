Feature:
	
	In order to be able to navigate around the site
	As a user I want to be able to select an inbound or outbound from the menus 
	And they take me to the appropriate location on or off the website

	(inbound link = will display an internally hosted page)
	(outbound link = will display an external page from a different site)

	Scenario: Select active inbound link
		Given I am on the Search page
		When I select an inbound link
		Then I am presented with the correct internal page

	Scenario: Select active outbound link
		Given I am on the Search page
		When I select an outbound link
		Then I am presented with the correct external page