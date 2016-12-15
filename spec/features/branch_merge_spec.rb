require 'rails_helper'

RSpec.feature 'User can request merge', :type => :feature do

  scenario "create project and then create merge request" do
    create_branch_as_user_3
    expect(page).to have_button("Send Request")
  end


  scenario "User should be able to click request merge button" do
    create_branch_as_user_3
    fill_in "Mix Request", with: "Please accept"
    click_link_or_button('Send Request')
    expect(page).to have_content("Request sent successfully")
  end

end
