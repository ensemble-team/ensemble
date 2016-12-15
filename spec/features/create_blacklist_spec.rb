require 'rails_helper'

RSpec.feature 'User can create a blaclist', :type => :feature do
  scenario "user can blacklist other user"  do
    create_collaboration_request
    sign_out
    sign_in
    visit('/projects/2500')
    click_button("Accept Request")
    click_button ("Create Blacklist")
    expect(Blacklist.count).to eq(1)


  end
end
