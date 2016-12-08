require 'rails_helper'
require 'support/controller_macros'

RSpec.describe ProjectsController, type: :controller do
  login_user

  # before { subject.stub(current_user: user, authenticate_user!: true) }

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

        expect(response).to have_http_status(:redirect)
        expect(flash[:notice]).to match(/^Project created successfully/)
      end

      it "shows flash message when project is not saved" do
        project_params = FactoryGirl.attributes_for(:project, title: nil)
        post :create, :project => project_params

        expect(response).to have_http_status(:redirect)
        expect(flash[:notice]).to match(/^Could not save the project, check the information entered/)
      end

      it "creates a new contact" do
        expect{ post :create, project: FactoryGirl.attributes_for(:project)}.to change(Project, :count).by(1)
      end
    end
  end

  describe "DELETE #destroy" do

    before :each do
      @project = create(:project)
    end

    it "shows flash message and redirects to project page when project is deleted" do
      post :destroy, :id => @project.id

      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Project deleted/)
    end

    it 'deletes a track' do
      expect{delete :destroy, id: @project.id}.to change(Project, :count).by (-1)
    end

  end


end
