module SettingsPanel
  include PageObject

  link( :leads_settings, :text => /^Leads$/ )
  link( :profile_settings, :text => /^Profile$/ )
  link( :contacts_settings, :text => /^Contacts$/ )

  @timeout_value = 7

  def go_to_leads_settings
    leads_settings_element.when_visible(@timeout_value).click
  end

  def go_to_profile_settings
    profile_settings_element.when_visible(@timeout_value).click
  end

  def go_to_contacts_settings
    contacts_settings_element.when_visible(@timeout_value).click
  end

end