require 'rails_helper'

RSpec.feature "Branch", type: :feature do

  context "delete branches" do

    it "can delete a branch" do
      create_branch_as_user_3
      expect{ click_link_or_button 'Delete Branch'}.to change{ Branch.count }.by(-1)
      expect(page).to have_content "Branch deleted"
    end

  end
end
