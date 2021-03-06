require "rails_helper"

RSpec.feature "User dashboard", type: :feature do

scenario "User makes collaboration request," do
    create_collaboration_request
    expect(page).to have_content('Request sent successfully')
  end

  scenario "User collaboration status changes" do
    create_collaboration_request
    sign_out
    sign_in
    visit '/projects/2500'
    click_link_or_button 'Accept Request'
    sign_out
    sign_in_as_user_3
    visit '/user/berrydingle'
    expect(page).to have_content('Status: Approved')
  end

  scenario "User sees mix requests on dashboard" do
    create_branch_as_user_3
    fill_in "request_message", with: "Please accept"
    click_link_or_button "Send Request"
    visit "/user/berrydingle"
    expect(page).to have_content("Mix request")
  end

end
