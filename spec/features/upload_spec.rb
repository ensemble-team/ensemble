require 'spec_helper'
require 'rails_helper'

RSpec.feature "Upload Process", :type => :feature  do

  it "creates a new project" do
    visit '/projects/new'
    fill_in "Title", with: "Nice Song"
    fill_in "Genre", with: "Sexy"
    fill_in "Description", with: "Nice sexy song"
    click_button "Create Project"
    expect(current_path).to eq("/projects/1")
  end

end
