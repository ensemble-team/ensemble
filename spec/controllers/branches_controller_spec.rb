require 'rails_helper'

RSpec.describe BranchesController, type: :controller do

    login_user
    let(:project) { create(:project) }
    let(:branch) { create(:branch, project_id: project.id )}

  describe "DELETE #destroy" do

  it "deletes a branch" do
    branch
    expect{delete :destroy, project_id: project, id: branch.id}.to change(Branch, :count).by (-1)
  end

  it "shows flash message and redirects to project page when project is deleted" do
    post :destroy, project_id: project, id: branch.id
    expect(response).to have_http_status(:redirect)
    expect(flash[:notice]).to match(/^Branch deleted/)
  end

  end

end
