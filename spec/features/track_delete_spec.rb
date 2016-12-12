require "rails_helper"

RSpec.feature "Track", type: :feature do


  context "delete tracks" do

    it "successfully deletes a track" do
      create_user
      upload_track
      expect{ click_link_or_button 'Remove track' }.to change{ Track.count }.by(-1)
      expect(page).to have_content "Track deleted"
    end

    it "non super user can't delete track uploaded by other user" do
      create_user
      upload_track
      sign_out
      sign_in_as_user_3
      expect(page).not_to have_selector("input[type=submit][value='Remove Track']")
    end

  end
end
