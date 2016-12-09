require 'spec_helper'
require 'rails_helper'

RSpec.feature "Project", :type => :feature  do


  it "uploads a track to a project" do
    sign_in
    @project = create(:project)
    visit "/projects/#{@project.id}"
    fill_in "track_title", with: "Nice Song"
    fill_in "Text", with: "Sexy"
    attach_file 'track_avatar', './spec/fixtures/files/mpthreetest.mp3'
    click_button "Create Track"
    expect(page).to have_content("Track uploaded")
    expect(page).to have_css("audio")
  end


  it "uploads a track to a branch" do
    create_branch
    fill_in "Title", with: "Nice Song"
    fill_in "Text", with: "Sexy"
    attach_file 'track_avatar', './spec/fixtures/files/mpthreetest.mp3'
    click_button "Create Track"
    expect(page).to have_content("Track uploaded")
    expect(page).to have_css("audio")
  end

end
