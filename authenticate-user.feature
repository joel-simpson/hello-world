Feature: Authenticate Dashboard User
  As an Archivematica User, I want to login using my existing username and password, 
  so that I can access the dashboard without needing to remember another password.

Scenario: Preservation-User logs in with correct credentials
  Given Alice has an existing account with her identity provider 
    And Alice has the entitlement "preservation-user"
  
  When Alice enters a URL for the Archivematica dashboard
  
  Then the Identity Provider presents a login page
    And Alice enters her user name <username> and password <password>
    And the Identity Provider presents an Information Release consent page
    And Alice selects the option "Ask me again at next login" and clicks "accept"
    And Alice is logged in with "preservation-user" privileges
