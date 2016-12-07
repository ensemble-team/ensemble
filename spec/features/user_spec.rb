require "rails_helper"

RSpec.feature "User", type: :feature do


  context "create user" do

    it "successfully create a user with email" do
      sign_up
      expect(User.count).to eq(1)
    end
    it "successfully log in/out a user" do
      sign_up
      sign_out
      sign_in
      expect(page).to have_content("Signed in successfully")
    end

    # context "facebook" do
    #   before (:each) do
    #     visit '/'
    #     click_link('Sign in with Facebook')
    #     facebook_sign_in
    #     # get "auth/facebook/callback"
    #     Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    #   end
    #   it "successfully create a user with facebook" do
    #     expect(User.count).to eq(1)
    #   end
    # end

  end
end
