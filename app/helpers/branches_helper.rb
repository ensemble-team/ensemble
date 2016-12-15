module BranchesHelper
  def create_notification(project, branch)
    return if project.user_id == current_user.id
    Notification.create!(owner_id: branch.id,
                         owner_type: 'Branch',
                         user_id: project.user_id,
                         notified_by: current_user.id)
  end

end
