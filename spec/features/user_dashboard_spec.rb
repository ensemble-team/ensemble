require "rails_helper"

RSpec.feature "User dashboard", type: :feature do

scenario "User makes collaboration request,", focus: true do
    create_user
    create_specific_project(2500)
    sign_out
    create_user_3
    sign_in_as_user_3
    visit('/projects/2500')
    fill_in "request_message", with: "Please accept"
    click_button "Create Request"
    visit('/user/berrydingle')
    expect(page).to have_content('My Collaboration Requests')
  end


end
