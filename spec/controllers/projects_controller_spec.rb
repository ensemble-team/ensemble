require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #new" do
    it "reutrns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end