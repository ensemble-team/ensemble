require 'rails_helper'

RSpec.feature 'User creates new branch', :type => :feature do

  before(:each) do

  end

  scenario 'user can create a new branch' do
      create_branch_as_user_3
      expect(page).to have_content "New branch"
      expect(page).to have_content "Trombone"
      expect(page).to have_content "Windy"
    end


    scenario 'prevents non contirbutor form uploading to branch' do
      create_user
      create_specific_branch(150)
      sign_out
      new_user_sign_in
      visit '/branches/2'
      expect(page).not_to have_content("Upload")
    end


end
