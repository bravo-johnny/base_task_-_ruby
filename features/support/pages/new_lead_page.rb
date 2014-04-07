require_relative 'top_menu_panel'
require_relative 'settings_panel'

class NewLeadPage
  include PageObject
  include TopMenuPanel

  labels( :custom_fields, :css => "div.custom-fields-items label.control-label" )

  def show_visible_custom_fields
    custom_fields_elements.each_with_index do |label, index|
      puts " #{index} > " +  label.text
    end
  end

  def cstm_flds_have_same_order? (cstm_fld_hashes)
    output = true
    if custom_fields_elements.size != cstm_fld_hashes.size
      output = false
    else
      cstm_fld_hashes.each_with_index{  |cstm_fld_hash, index|
        output = output & true
        if custom_fields_elements[index].text != cstm_fld_hash[:name]
          puts " === Unmatched elements found ! ==="
          puts "local custom field: " + custom_fields_elements[index]
          puts "saved custom field: " + cstm_fld_hash[:name]
          output = output & false
        end
      }
    end
    output
  end

end