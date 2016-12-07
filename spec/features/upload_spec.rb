require 'spec_helper'
require 'rails_helper'

RSpec.feature "Project", :type => :feature  do

  before(:each) do
    sign_in
    @project = create(:project)
  end

  it "creates a new project" do

    visit "/projects/#{@project.id}"
    fill_in "Title", with: "Nice Song"
    fill_in "Text", with: "Sexy"
    attach_file 'track_avatar', './spec/fixtures/files/mpthreetest.mp3'
    click_button "Create Track"
    expect(page).to have_content("Track uploaded")
    expect(page).to have_css("audio")
  end

end
