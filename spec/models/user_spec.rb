# require 'rails_helper'
# require 'omniauth'
# require 'support/controller_macros'
# RSpec.describe User, type: : do
#
#     before do
#     Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
#     end
#
#
#     describe "#create" do
#
#       it "should successfully create a user", focus: true do
#         user_params = FactoryGirl.attributes_for(:user)
#         expect{ post :create, user: user_params }.to change{ User.count }.by(1)
#       end
    #
    #   it "should successfully create a session" do
    #     session[:user_id].should be_nil
    #     post :create, provider: :facebook
    #     session[:user_id].should_not be_nil
    #   end
    #
    #   it "should redirect the user to the root url" do
    #     post :create, provider: :facebook
    #     response.should redirect_to root_url
    #   end
    #
    # end
    #
    # describe "#destroy" do
    #   before do
    #     post :create, provider: :facebook
    #   end
    #
    #   it "should clear the session" do
    #     session[:user_id].should_not be_nil
    #     delete :destroy
    #     session[:user_id].should be_nil
    #   end
    #
    #   it "should redirect to the home page" do
    #     delete :destroy
    #     response.should redirect_to root_url
    #   end
    # end
  # end
  # end
