module WebHelpers
  def sign_in
    @user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  def new_user_sign_in
    @user2 = create(:user, email: "ensemble@gmail.com", id: 2)
    visit new_user_session_path
    fill_in 'Email', with: @user2.email
    fill_in 'Password', with: @user2.password
    click_button 'Log in'
  end

  def upload_track
    sign_in
    @project = create(:project)
    @track = create(:track, track_owner_id: @project.id, track_owner_type: "Project")
    visit "/projects/#{@project.id}"
  end

  def sign_in_again
    visit "/users/sign_in"
    fill_in "user_email",  with: @user.email
    fill_in "user_password",  with: @user.password
    click_button "Log in"
  end

  def sign_in_as_different_user
    @another_user = create(:user, email: "test2@test.com", password: "password", password_confirmation: "password", id: 2)
    visit new_user_session_path
    fill_in 'Email', with: @another_user.email
    fill_in 'Password', with: @another_user.password
    click_button 'Log in'
    visit "/projects/#{@project.id}" #specific for track_delete_spec
  end

  def sign_out
    click_link ("Logout")
  end

  def create_project
    sign_in
    click_button "New Project"
    fill_in "Title", with: "New project"
    fill_in "Genre", with: "Funk"
    fill_in "Description", with: "Great new song"
    click_button "Create Project"
  end

  def create_specific_project(id)
    sign_in
    @project = create(:project, id: id)
  end

  def create_specific_branch(id)
    sign_in
    @project = create(:project, id: id)
    @branch = create(:branch, project_id: @project.id, id: 2)
  end


  def create_branch
    create_project
    fill_in "branch_title", with: "New branch"
    fill_in "Instrument", with: "Trombone"
    fill_in "Description", with: "Windy"
    click_button "Create Branch"
  end


end
