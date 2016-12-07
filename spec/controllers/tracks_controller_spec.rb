require 'rails_helper'


RSpec.describe TracksController, type: :controller do
  login_user


  describe "POST #create" do
    let(:project) { create :project }
    # let(:track) { create :track, project_id: project.id }

    it "creates a track" do
      p project
      # p track
      # track_params = FactoryGirl.attributes_for(:track, project_id: project.id)
      # p track_params

      expect{post :create, track: FactoryGirl.attributes_for(:track, project_id: project.id)}.to change(Track, :count).by 1
    end
  end

end
