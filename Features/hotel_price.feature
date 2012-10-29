@javascript
Feature: Search for hotels in a price range
In order to find a hotel in the user's price range
As a user searching for hotels
I want to search for hotels with a price range and only see hotels returned within that range

Scenario: Search for a hotel in a price range 
	Given I am on the EWS Search page
	And I have entered a price range
	When I click Search
	Then I am presented with an appropriate list of hotels
