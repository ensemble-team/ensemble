require 'rails_helper'

RSpec.feature 'User creates new project', :type => :feature do
  scenario 'user can see project creation page' do
    visit new_project_path

    expect(page).to have_content 'New Project'
  end
end
