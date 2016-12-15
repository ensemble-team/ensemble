require 'rails_helper'

RSpec.feature 'User creates new request', :type => :feature do

  scenario 'user can send a request on a branch page' do
    create_branch_as_user_3
    fill_in "Mix Request", with: "Please accept"
    click_button "Send Request"
    expect(page).to have_content "Request sent successfully"
  end

  scenario 'user can send a request on a project page' do
    create_user
    create_specific_project(1)
    sign_out
    create_user_3
    sign_in_as_user_3
    visit ("/projects/1")
    fill_in "Message", with: "Please accept"
    click_button "Collaboration Request"
    expect(page).to have_content "Request sent successfully"
  end
end
