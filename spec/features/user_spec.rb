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

  end
end
