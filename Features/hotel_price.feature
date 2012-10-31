Feature: Searching for hotels in a particular price range
In order to find a hotel in a user's price range
As a user searching for hotels and entering valid data
I want to search for hotels in a price range and only see hotels returned within that range

Scenario: Search for a hotel in a price range 
	Given the user is using price ranges such as:
		|price|
		|1-50|
		|51-100|
		|101-150|
		|151-200|
		|201-250|
		|251-300|
		|301 and above|
	When valid data is entered in all other mandatory fields
		# Use an arrival date that is 2 weeks in the future
		# Select a town e.g. Chester
	And the search button is clicked
	Then the price of the hotel returned should not be more than:
		|max_hotel_price|
		|50|
		|100|
		|150|
		|200|
		|250|
		|300|
		|999|
	
