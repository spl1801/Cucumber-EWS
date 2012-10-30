@javascript
Feature: error handling on the search screen

	As a user I when I leave all search fields blank 
	and click search 
	I am presented with an appropriate error message

	Scenario: All fields blank
	Given that I am on the search page
	When I do not enter any information and click search
	Then I am presented with the appropriate error messages
	
	Scenario: Postcode and Location fields blank
	Given that I am on the search page
	When I enter all valid details but a blank location and postcode
	Then I am presented with the appropriate error messages