require 'rails_helper'

RSpec.feature 'User creates new request', :type => :feature do

  scenario 'user can send a request on a branch page' do
      create_project
      fill_in "Body", with: "Great song"
      click_button "Create Comment"
      expect(page).to have_content "Comment added"
      expect(page).to have_content "Great song"
    end
end
