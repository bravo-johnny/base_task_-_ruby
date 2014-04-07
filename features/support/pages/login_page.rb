class LoginPage
  include PageObject

  text_field( :email, :id => "user_email" )
  text_field( :password, :id => "user_password" )
  button( :login_btn, :value => /\s*Login/ )


  def login_with_credentials( user, pass )
    self.email = user
    self.password = pass
    login_btn
  end

end