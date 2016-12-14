# require 'rails_helper'
#
# RSpec.describe MessagesController, type: :controller do
#   login_user
#   let(:project) { create(:project) }
#   # let(:user)   { create(:user, user.id: 1)}
#
#   context "#create message to project owner" do
#     # before do
#     #   @project_params = FactoryGirl.attributes_for(:project, project_id: project.id)
#     # end
#
#     it "shows flash message for success " do
#       p "hi2"
#       request.env['HTTP_REFERER'] = 'http://example.com'
#       p "hi3"
#
#       message_params = FactoryGirl.attributes_for(:message, project_id: project.id)
#       post :create, :message => message_params
#       p "hi4"
#       p current_user
#       expect(flash[:notice]).to match(/^Message sent successfully/)
#       p "hi5"
#       end
#   #
#   #   it "sends a message to the project owner"
#   #
#   # end
#   end
# end
