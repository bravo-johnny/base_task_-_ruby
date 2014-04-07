require_relative 'top_menu_panel'

class LeadsPage
  include PageObject
  include TopMenuPanel

  link( :new_lead_btn, { :class => "btn", :text=> /Lead/ } )

  def go_to_add_lead_page
    new_lead_btn
  end


end