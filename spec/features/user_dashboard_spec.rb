require "rails_helper"

RSpec.feature "User dashboard", type: :feature do

scenario "User makes collaboration request,", focus: true do
    create_collaboration_request
    visit('/user/berrydingle')
    expect(page).to have_content('My Collaboration Requests')
  end

  scenario "User collaboration status changes", focus: true do
    create_collaboration_request
    sign_out
    sign_in
    visit '/projects/2500'
    click_link_or_button 'Accept Request'
    sign_out
    sign_in_as_user_3
    visit '/user/berrydingle'
    expect(page).to have_content('Status:Approved')
  end

  scenario "User sees mix requests on dashboard", focus: true do
    create_branch_as_user_3
    fill_in "request_message", with: "Please accept"
    click_link_or_button "Create Request"
    visit "/user/berrydingle"
    expect(page).to have_content("My Mix Request")
  end

end
