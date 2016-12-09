require 'rails_helper'

RSpec.feature 'User creates new request', :type => :feature do

  scenario 'user can send a request on a branch page' do
    create_branch
    fill_in "Message", with: "Please accept"
    click_button "Create Request"
    expect(page).to have_content "Request sent successfully"
  end
  # scenario 'user can send a request on a project page' do
  #   create_project
  #   fill_in "Message", with: "Please accept"
  #   click_button "Create Request"
  #   expect(page).to have_content "Request sent successfully"
  # end

end
