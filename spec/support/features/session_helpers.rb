module Features
  module SessionHelpers
    before :each do
      user = User.build(:user)
    end
    def sign_up_with
      visit new_user_path
      find('input#user_email').set(user.email)
      find('input#user_username').set(user.username)
      find('input#user_latitude').set(user.latitude)
      find('input#user_longitude').set(user.longitude)
      find('input#user_password').set(user.password)
      find('input#user_password_confirmation').set(user.password)
      find('input#sign-up').click
    end

    def sign_in
      visit login_path
      find('input#session_email').set(user.email)
      find('input#session_password').set(user.password)
      find('input#sign-in').click
    end
  end
end

