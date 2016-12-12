require "rails_helper"

RSpec.feature "Track", type: :feature do


  context "delete tracks" do

    it "successfully deletes a track" do
      upload_track
      expect{ click_link_or_button 'Remove Track' }.to change{ Track.count }.by(-1)
      expect(page).to have_content "Track deleted"
    end

    it "non super user can't delete track uploaded by other user" do
      upload_track
      sign_out
      sign_in_as_different_user
      expect(page).not_to have_selector("input[type=submit][value='Remove Track']")
    end

  end
end
