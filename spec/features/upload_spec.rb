require 'spec_helper'
require 'rails_helper'

RSpec.feature "Project", :type => :feature  do

  before(:each) do
    sign_in
  end

  it "creates a new project" do
    visit '/projects/new'
    fill_in "project_title", with: "Nice Song"
    fill_in "project_text", with: "Sexy"
    
    click_button "Upload Track"
    expect(page).to have_content("Track uploaded")
  end

end
