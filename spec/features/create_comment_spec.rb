require 'rails_helper'

RSpec.feature 'User writes new comment', :type => :feature do

  scenario 'user can write a comment on a project page' do
      create_project
      fill_in "Body", with: "Great song"
      click_button "Create Comment"
      expect(page).to have_content "Comment added"
      expect(page).to have_content "Great song"
    end

  scenario 'user can write a comment on a branch page' do
      create_branch
      fill_in "Body", with: "Great song"
      click_button "Create Comment"
      expect(page).to have_content "Comment added"
      expect(page).to have_content "Great song"
    end



end