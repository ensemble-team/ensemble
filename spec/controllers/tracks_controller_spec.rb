require 'rails_helper'


RSpec.describe TracksController, type: :controller do

  login_user
  let!(:project) { create :project }
  let!(:track) { create :track, project_id: project.id}

  before do
    @project_params = FactoryGirl.attributes_for(:project, project_id: project.id)
  end

  describe "GET #index" do

    it "has an index route" do
      get :index, { :project_id => project.id }
      expect(response).to have_http_status(:success)
    end

  end


  describe "POST #create" do

    it "shows flash message and redirects to project page" do
      post :create, :project_id => project.id, track: @project_params

      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Track uploaded/)
    end

    it "creates a track" do
      expect{post :create, :project_id => project.id, track: @project_params }.to change(Track, :count).by 1
    end
  end

  describe "DELETE #destroy" do

    it 'deletes a track' do
      expect{delete :destroy, project_id: project.id, id: track.id}.to change(Track, :count).by (-1)
    end

  end

end
