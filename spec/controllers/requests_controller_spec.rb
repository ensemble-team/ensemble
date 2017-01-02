require 'rails_helper'

RSpec.describe RequestsController, type: :controller do

  login_user
  let!(:project ) { create :project }

  context "#create mix request on branch" do
    before do
      @branch_params = FactoryGirl.attributes_for(:branch, branch_id: branch.id)
      @project_params = FactoryGirl.attributes_for(:project, project_id: project.id)
      # @request_params = FactoryGirl.attributes_for(:request, request_id: request.id)
    end
    let!(:branch ) { create :branch, project_id: project.id}
    it "shows flash message and redirect to branch page" do
      request.env['HTTP_REFERER'] = 'http://example.com'
      post :create, branch_id: branch.id, request: FactoryGirl.attributes_for(:request, request_owner_id: branch.id)
      expect(flash[:notice]).to match(/^Request sent successfully/)
    end

    it "shows flash message for failure " do
      request.env['HTTP_REFERER'] = 'http://example.com'
      post :create, branch_id: branch.id, request: FactoryGirl.attributes_for(:request, request_owner_id: branch.id, message: nil)
      expect(flash[:notice]).to match(/^You need to enter a message before pressing send/)
    end
  end

  context "#create collaborate request on project page" do
    before do
      @project_params = FactoryGirl.attributes_for(:project, project_id: project.id)
      # @request_params = FactoryGirl.attributes_for(:request, request_id: request.id)
    end

    it "shows flash message for failure " do
      request.env['HTTP_REFERER'] = 'http://example.com'
      post :create, project_id: project.id, request: FactoryGirl.attributes_for(:request, request_owner_id: project.id, message: nil)
      expect(flash[:notice]).to match(/^You need to enter a message before pressing send/)
    end
  end

end
