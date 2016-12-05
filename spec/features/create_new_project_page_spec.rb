require 'rails_helper'

RSpec.feature 'User creates new project', :type => :feature do
  scenario 'user can see project creation page' do
    visit new_project_path

    expect(page).to have_content 'New Project'
  end

  scenario 'user can input project details' do
    visit new_project_path

    expect(page).to have_content 'Title'
    expect(page).to have_content 'Genre'
    expect(page).to have_content 'Description'
    page.has_button? 'Create Project'
  end
end
