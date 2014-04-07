Given(/^I am logged in to the BASE website as a '(.*?)', with password '(.*?)'$/) do   |user, pass|
  visit(HomePage)
  on(HomePage).proceed_to_login_page
  on(LoginPage).login_with_credentials( user, pass )
end

When(/^I visit the 'customize Leads' page/) do
  on(DashboardPage).go_to_settings
  on(SettingsProfilePage).go_to_leads_settings
end

Then(/^I should see the list of (\d+) custom fields$/) do |value|
  # requested "helper" method, that returns <K, V> pairs
  @custom_fields_hash = on(SettingsLeadsPage).get_custom_fields_hash_array
  @custom_fields_hash.size.to_s.should == value
  puts "####### Custom fields found on the <settings> page:\n#{@custom_fields_hash}"
end

Given(/^I know the list of custom fields$/) do
  puts "i've found following custom field pairs: \n" + @custom_fields_hash.to_s
end

When(/^I try to add a new lead$/) do
  on(DashboardPage).go_to_leads
  on(LeadsPage).go_to_add_lead_page
  #on(NewLeadPage).show_visible_custom_fields
end

Then(/^I should see exactly the same order of custom fields as in settings$/) do
  on(NewLeadPage).cstm_flds_have_same_order?(@custom_fields_hash).should == true
  puts "####### Custom fields found on the <new lead> page:\n"
  on(NewLeadPage).show_visible_custom_fields
end