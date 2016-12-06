require 'rails_helper'

RSpec.describe EnsembleController, type: :controller do

  # it "kowns that true is true" do
  #   expect(true).to be(true)
  # end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
