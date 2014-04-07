class HomePage
  include PageObject

  page_url 'https://getbase.com/'

  link( :proceed_to_login_page, :text => "Login" )

end