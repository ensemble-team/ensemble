require 'rails_helper'

RSpec.describe TracksController, type: :controller do

  describe "GET #upload" do
    it "returns http success" do
      get :upload
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    it "returns http success" do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end

end
