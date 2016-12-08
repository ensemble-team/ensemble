require "rails_helper"

RSpec.feature "Track", type: :feature do


  context "delete tracks", :focus => true do

    it "successfully deletes a track" do
      upload_track
      expect{ click_link_or_button 'Remove track' }.to change{ Track.count }.by(-1)
      expect(page).to have_content "Track deleted"
    end

  end
end
