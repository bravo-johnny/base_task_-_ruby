Feature: Checking custom fields for Leads
  As a candidate for an UX Guard
  I want to retrieve list of all custom fields
  So i can check if those field are visible on the new/Edit lead page

Background:
  Given I am logged in to the BASE website as a 'qa1@os.pl', with password 'secretpassword'

  Scenario: Checking custom fields
    When I visit the 'customize Leads' page
    Then I should see the list of 9 custom fields
    When I try to add a new lead
    Then I should see exactly the same order of custom fields as in settings



#  Scenario: comparison of the custom fields on different pages
#    Given I know the list of custom fields
#    When I try to add a new lead
#    Then i should see exactly the same order of custom fields as in settings

