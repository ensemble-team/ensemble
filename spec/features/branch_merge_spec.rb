require 'rails_helper'

RSpec.feature 'User can request merge', :type => :feature do

  scenario "create project and then create merge request" do
    create_branch_as_user2
    expect(page).to have_content("Request Mix Track")
  end


  scenario "User should be able to click request merge button" do
    create_branch_as_user2
    expect{ click_link_or_button 'Request Mix Track'}.to have_http_status(:redirect)
    expect(flash[:notice]).to match(/^Request sent/)
  end

end
