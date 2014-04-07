module TopMenuPanel
  include PageObject

  link( :leads_btn, :id => "nav-leads" )
  link( :cogs_btn, :href => "#user-dd" )
  link( :settings_btn, :text => "Settings" )

  def go_to_settings
    cogs_btn
    settings_btn
  end

  @@attempt_counter = 3

  def go_to_leads
    leads_btn
  end


end