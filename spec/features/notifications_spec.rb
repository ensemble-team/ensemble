require 'rails_helper'

RSpec.feature "Notifications", type: :feature do

  scenario "Notification of collaboration request" do
    create_collaboration_request
    expect(Notification.count).to eq(1)
  end

  scenario "Notification of mix request" do
    create_branch_as_user_3
    fill_in "request_message", with: "Please accept"
    expect{ click_button "Send Request" }.to change { Notification.count }.by(1)
  end

  scenario "Notification of messages" do
    create_branch_as_user_3
    fill_in "message_body", with: "Hello"
    expect{ click_button "Create Message" }.to change { Notification.count }.by(1)
  end

end
