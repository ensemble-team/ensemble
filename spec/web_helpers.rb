def sign_up
  visit "/users/sign_up"
  fill_in "user_email",  with: "tom@gmail.com"
  fill_in "user_password",  with: "password"
  fill_in "user_password_confirmation",  with: "password"
  click_button "Sign up"
end

def sign_in
  visit "/users/sign_in"
  fill_in "user_email",  with: "tom@gmail.com"
  fill_in "user_password",  with: "password"
  click_button "Log in"
end

def sign_out
  click_link ("Logout")
end

def create_project
  sign_up
  click_button "New Project"
  fill_in "Title", with: "New project"
  fill_in "Genre", with: "Funk"
  fill_in "Description", with: "Great new song"
  click_button "Create Project"
end


def create_branch
  create_project
  fill_in "branch_title", with: "New branch"
  fill_in "Instrument", with: "Trombone"
  fill_in "Description", with: "Windy"
  click_button "Create Branch"
end

def facebook_sign_in
  # visit "/"
  # click_link("Sign in with Facebook")
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        'provider' => 'facebook',
        'uid' => '12345',
        'user_info' => {
          'username' => 'Tom',
          'email' => 'tom@gmail.com'
        },
        'credentials' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        }
      })

  OmniAuth.config.add_mock(:facebook, {uid: '12345'})
end
