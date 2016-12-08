require 'rails_helper'

RSpec.feature 'User creates new branch', :type => :feature do

  scenario 'user can create a new branch' do
      create_branch
      expect(page).to have_content "New branch"
      expect(page).to have_content "Trombone"
      expect(page).to have_content "Windy"
    end

end
