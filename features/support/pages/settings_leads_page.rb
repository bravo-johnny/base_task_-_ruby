require_relative 'top_menu_panel'
require_relative 'settings_panel'

class SettingsLeadsPage
  include PageObject
  include TopMenuPanel
  include SettingsPanel

  labels( :custom_fields, { :class => "control-label", :text=> /.+\(.+\)$/ } )

  def get_custom_fields_hash_array

    @@attempt_counter.times { |nr_of_attempt|
      begin
        custom_fields_elements.nil?
        break
      rescue Selenium::WebDriver::Error::StaleElementReferenceError => ex
        puts "Ups! It seems that I caught StaleElementReferenceError. Retrying ... attempt: " + (nr_of_attempt+1).to_s + " of #{@@attempt_counter}"
        retry
      end
    }
    custom_fields_array = []
    custom_fields_elements.each do |d|
      name = d.text.sub( /(.*) \(.*/, '\1' )
      type = d.text.sub( /.*\((.*)\)/, '\1' )
      hash = { :name => name, :type => type }
      custom_fields_array.push(hash)
    end

    custom_fields_array
  end

end