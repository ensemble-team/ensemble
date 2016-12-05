require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #new" do
    it "retrns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "when a new project is created" do
      it "shows flash message and redirects to project page" do
        project_params = FactoryGirl.attributes_for(:project)
        post :create, :project => project_params

        expect(response).to redirect_to "/projects/1"
        expect(flash[:notice]).to match(/^Project created successfully/)
      end
    end
  end

end
