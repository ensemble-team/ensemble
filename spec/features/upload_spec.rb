require 'spec_helper'
require 'rails_helper'

RSpec.feature "Project", :type => :feature  do


  it "uploads a track to a project" do
    create_user
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
    create_user
    create_branch
    fill_in "Title", with: "Nice Song"
    fill_in "Text", with: "Sexy"
    attach_file 'track_avatar', './spec/fixtures/files/mpthreetest.mp3'
    click_button "Create Track"
    expect(page).to have_content("Track uploaded")
    expect(page).to have_css("audio")
  end

  it "prevents non super user from uploading track" do
    create_user
    create_specific_project(100)
    sign_out
    new_user_sign_in
    visit "/projects/100"
    expect(page).not_to have_content("Upload Your Master Track")
    expect(page).to have_content("ensemble@gmail.com")
  end

end
