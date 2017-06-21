Feature: Authenticate Dashboard User
  As an Archivematica User, I want to login using my existing username and password, 
  so that I can access the dashboard without needing to remember another password.

Scenario: Preservation-User logs in with correct credentials
  Given <user> has an existing account with her identity provider 
    And <user> has the entitlement <entitlement>
    And <user> has an existing Archivematica user account 
  
  When <user> enters (or clicks) a URL for the Archivematica dashboard
    And Archivematica determines <user> is not already logged in
    And the Identity Provider determines the <user> does not have an existing authenticated session
  
  Then the Identity Provider presents a login page
    And <user> enters their user name <username> and password <password>
    And the Identity Provider presents an Information Release consent page
    And <user> selects the option "Ask me again at next login" and clicks "accept"
    And <user> is logged in with <role> privileges
    And <user> is presented with the default transfer page 
    
  Examples:
    | user  | username | password | entitlement        | role       |
    | Alice | aa       | aa12345  | preservation-user  | default    |
    | Bert  | bb       | bb12345  | preservation-admin | admin      |
