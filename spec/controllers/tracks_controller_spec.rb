require 'rails_helper'


RSpec.describe TracksController, type: :controller do

  login_user
  let(:project) { create(:project) }
  let(:track) {create(:track, track_owner_id: project.id, track_owner_type: "Project")}

  before do
    @track_params = FactoryGirl.attributes_for(:track, track_owner_id: project.id, track_owner_type: "Project")
  end

  describe "GET #index" do

    it "has an index route" do
      get :index, { :project_id => project.id }
      expect(response).to have_http_status(:success)
    end

  end


  describe "POST #create", :focus => true do

    it "shows flash message and redirects to project page when created" do
      post :create, :project_id => project.id, track: @track_params

      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Track uploaded/)
    end

    it "shows flash message and redirects to project page when not created" do
      p project
      p track
      p @track_params
      post :create, :project_id => project.id, track: FactoryGirl.attributes_for(:track, track_owner_id: project.id, title: nil, track_owner_type: "Project")

      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Could not save the track, check the information entered/)
    end

    it "creates a track" do
      expect{post :create, :project_id => project.id, track: @track_params }.to change(Track, :count).by 1
    end
  end

  describe "DELETE #destroy" do

    it "shows flash message and redirects to project page when track is deleted" do
      post :destroy, :project_id => project.id, id: track.id

      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Track deleted/)
    end

    it 'deletes a track' do
      expect{delete :destroy, project_id: project.id, id: track.id}.to change(Track, :count).by (-1)
    end

  end

end
