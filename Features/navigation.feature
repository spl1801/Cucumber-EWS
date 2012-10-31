Feature:
	
	In order to be able to navigate around the site
	As a user I want to be able to select an inbound or outbound from the menus 
	And they take me to the appropriate location on or off the website

	(inbound link = will display an internally hosted page)
	(outbound link = will display an external page from a different site)

	Scenario Outline: Select active inbound link
		Given I am on the EWS Search page
		When I select the link "<inbound>"
		Then I am presented with the correct "<internal>" page
		
		Examples:
			| inbound | internal |
			| Hotels | Hotel Search |
#			| Bookers Toolkit | Bookers Toolkit |
			| M.I.C.E. | Meetings, Incentives, Conferences & Events |
			| Exhibitions | To search for international events, please select the appropriate country |
			| FAQ | Frequently Asked Questions |
			| Expotel.com | Member Login |
			| http://booking.expotel.com/tilesaction.do?formatname=registerwhy | Registration is fast and free!	|
			| Terms & Conditions | Expotel Terms &amp; Conditions |
			| Privacy Policy | Privacy Policy |
			| Contact Us | Contact Us |
			| exact:Forgotten password? | Forgotten Password |
			| Register Now | Please Register Below |
#
#
#	Scenario: Select active outbound link
#		Given I am on the EWS Search page
#		When I select an outbound link
#		Then I am presented with the correct external page