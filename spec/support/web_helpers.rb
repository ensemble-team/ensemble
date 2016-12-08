module WebHelpers
  def sign_in
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def upload_track
    sign_in
    @project = create(:project)
    @track = create(:track, project_id: @project.id)
    visit "/projects/#{@project.id}"
  end

end
