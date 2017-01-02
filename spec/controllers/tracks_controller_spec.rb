require 'rails_helper'


RSpec.describe TracksController, type: :controller do

  login_user
  let(:project) { create(:project) }
  let(:track) {create(:track, owner_id: project.id, owner_type: "Project")}


  before do
    @track_params = FactoryGirl.attributes_for(:track, track_owner_id: project.id, track_owner_type: "Project")
  end

  describe "GET #index" do

    it "has an index route" do
      get :index, { :project_id => project.id }
      expect(response).to have_http_status(:success)
    end

  end


  describe "POST #create" do

    it "shows flash message and redirects to project page when created" do
      request.env['HTTP_REFERER'] = 'http://example.com'
      post :create, :project_id => project.id, track: @track_params

      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Track uploaded/)
    end

    it "shows flash message and redirects to project page when not created" do
      request.env['HTTP_REFERER'] = 'http://example.com'
      post :create, :project_id => project.id, track: FactoryGirl.attributes_for(:track, track_owner_id: project.id, title: nil, track_owner_type: "Project")

      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^You need to enter track title before pressing upload/)
    end

    it "creates a track" do
      request.env['HTTP_REFERER'] = 'http://example.com'
      expect{post :create, :project_id => project.id, track: @track_params }.to change(Track, :count).by 1
    end
  end

  describe "DELETE #destroy" do

    it "shows flash message and redirects to project page when track is deleted" do
      request.env['HTTP_REFERER'] = 'http://example.com'
      post :destroy, :project_id => project.id, id: track.id

      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Track deleted/)
    end

    it 'deletes a track' do
      track
      expect{delete :destroy, project_id: project.id, id: track.id}.to change(Track, :count).by (-1)
    end

  end

end
