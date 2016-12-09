require 'rails_helper'

RSpec.describe RequestsController, type: :controller do

  login_user
  let!(:project ) { create :project }
  let!(:branch ) { create :branch, project_id: project.id}

  before do
    @branch_params = FactoryGirl.attributes_for(:branch, branch_id: branch.id)
    @project_params = FactoryGirl.attributes_for(:project, project_id: project.id)
    @request_params = FactoryGirl.attributes_for(:request, branch_id: branch.id)
  end

  context "#create" do
    it "shows flash message and redirect to branch page" do
      post :create, branch_id: branch.id, request: @request_params
      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Request sent successfully/)
    end

    it "shows flash message for failure " do
      post :create, branch_id: branch.id, request: FactoryGirl.attributes_for(:request, branch_id: branch.id, message: nil)
      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to match(/^Could not send the request, check the information entered/)
    end
  end
end
