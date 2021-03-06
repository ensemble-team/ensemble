require 'rails_helper'

RSpec.feature 'User creates new project', :type => :feature do

  scenario 'user can see project creation page' do
    create_user
    sign_in
    visit new_project_path
    expect(page).to have_content 'New Project'
  end

  scenario 'user can input project details' do
    create_user
    sign_in
    visit new_project_path
    expect(page).to have_content 'Title'
    page.has_button? 'Create Project'
  end

  scenario 'user can created a new project' do
    create_user
    sign_in
    visit new_project_path
    fill_in 'project_title', with: 'Moon Beam'
    fill_in 'project_genre', with: 'Jazz'
    fill_in 'project_description', with: 'Free flowing funk'
    click_button 'Create Project'

    expect(page).to have_content 'Project created successfully'
  end


  scenario 'user must input title of project to create project' do
    create_user
    sign_in
    visit new_project_path
    fill_in 'project_genre', with: 'Jazz'
    fill_in 'project_description', with: 'Free flowing funk'
    click_button 'Create Project'
    expect(page).to have_content 'Please enter a project title'
  end

  scenario "delete projects" do
    create_user
    sign_in
    visit new_project_path
    fill_in 'project_title', with: 'Moon Beam'
    fill_in 'project_genre', with: 'Jazz'
    fill_in 'project_description', with: 'Free flowing funk'
    click_button 'Create Project'
    expect{ click_link_or_button 'Delete Project' }.to change{ Project.count }.by(-1)
    expect(page).to have_content "Project deleted"

  end

  context "Mix request" do
    it 'button is present on page after contributing user sends request' do
      create_branch_as_user_3
      fill_in 'Mix Request', with: "Please Accept"
      click_link_or_button("Send Request")
      sign_out
      sign_in
      visit('projects/1000')
      expect(page).to have_button('View Mix Request')
    end

    it 'project owner see master and branch tracks' do
      create_branch_as_user_3
      fill_in 'Mix Request', with: "Please Accept"
      click_link_or_button("Send Request")
      sign_out
      sign_in
      visit('projects/1000')
      click_link_or_button("View Mix Request")
      expect(page).to have_css('audio')
    end

    it 'project owner can merge tracks' do
      create_branch_as_user_3
      fill_in 'Mix Request', with: "Please Accept"
      click_link_or_button("Send Request")
      sign_out
      sign_in
      visit('projects/1000')
      click_link_or_button("View Mix Request")
      click_button('Approve Mix Request')
      sign_out
      sign_in_as_user_3
      visit('/user/berrydingle')
      expect(page).to have_content('Status: Approved')
    end


    it 'project owner can merge tracks' do
      create_branch_as_user_3
      fill_in 'Mix Request', with: "Please Accept"
      click_link_or_button("Send Request")
      sign_out
      sign_in
      visit('projects/1000')
      click_link_or_button("View Mix Request")
      click_button('Reject Mix Request')
      expect(page).to have_content('Rejected mix')
      expect(current_path).to eq('/projects/1000')
    end

  end


  context "user can reject collaborator" do
    it "flashes rejected collaborator" do
      create_user
      create_specific_project(5)
      sign_out
      create_user_3
      sign_in_as_user_3
      visit('projects/5')
      fill_in "Message", with: "Please accept"
      click_button "Collaboration Request"
      sign_out
      sign_in
      visit('projects/5')
      click_link_or_button('Reject Request')
      expect(page).to have_content('Rejected collaborator')
    end
  end

end
