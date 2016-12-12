require 'rails_helper'

RSpec.feature 'User can request merge', :type => :feature, focus: true do

  scenario "create project and then create merge request" do
    create_branch_as_user_3
    expect(page).to have_button("Create Request")
  end


  scenario "User should be able to click request merge button" do
    create_branch_as_user_3
    expect{ click_link_or_button 'Create Request'}.to have_http_status(:redirect)
    expect(flash[:notice]).to match(/^Request sent successfully/)
  end

end
