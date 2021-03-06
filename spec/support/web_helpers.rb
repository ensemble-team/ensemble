module WebHelpers

  def create_user
    create(:user)
  end

  def create_user_3
    create(:user, username: 'berrydingle', email: "berrydingle@email.com", password: "password", password_confirmation: "password", id: 3)
  end

  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
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
    @track = create(:track, owner_id: @project.id, owner_type: "Project")
    visit "/projects/#{@project.id}"
  end

  def sign_in_again
    visit "/users/sign_in"
    fill_in "user_email",  with: 'test@test.com'
    fill_in "user_password",  with: 'password'
    click_button "Log in"
  end

  def sign_in_as_user_3
    visit 'users/sign_in'
    fill_in 'Email', with: 'berrydingle@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button 'Log in'
    # visit "/projects/#{@project.id}" #specific for track_delete_spec
  end

  def sign_out
    visit destroy_user_session_path
  end

  def create_project
    sign_in
    visit ("projects/new")
    fill_in "Title", with: "New project"
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

  def create_branch_as_user_3
    create_user
    create_specific_project(1000)
    sign_out
    create_user_3
    sign_in_as_user_3
    visit('projects/1000')
    fill_in "Message", with: "Please accept"
    click_button "Collaboration Request"
    sign_out
    sign_in
    visit('projects/1000')
    click_link_or_button('Accept Request')
    sign_out
    sign_in_as_user_3
    visit('projects/1000')
    fill_in "branch_title", with: "New branch"
    fill_in "Instrument", with: "Trombone"
    fill_in "Description", with: "Windy"
    click_button("Create Branch")
    @track = create(:track, owner_id: @project.id, owner_type: "Project")
    fill_in "Track Title", with: "Super song"
    click_button('Upload Track')
  end

  def create_branch_request
    create_branch_as_user_3
    fill_in "Message", with: "Please accept"
    click_button "Send Request"
  end

  def create_collab_request
    create_project
    fill_in "Message", with: "Please accept my collab request"
    click_button "Create Request"
  end

  def create_collaboration_request
    create_user
    create_specific_project(2500)
    sign_out
    create_user_3
    sign_in_as_user_3
    visit('/projects/2500')
    fill_in "request_message", with: "Please accept"
    click_button "Collaboration Request"
  end

end
