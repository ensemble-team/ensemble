require "rails_helper"

RSpec.feature "User", type: :feature do


  context "create user" do

    it "successfully create a user with email" do
      create_user
      sign_in
      expect(User.count).to eq(1)
    end
    it "successfully log in/out a user" do
      create_user
      sign_in
      sign_out
      sign_in_again
      expect(page).to have_content("Signed in successfully")
    end

  end
end
