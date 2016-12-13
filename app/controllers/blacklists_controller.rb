class BlacklistsController < ApplicationController

  def create
    @block_source = Project.find(params[:project_id])
    @blacklist = @block_source.blacklists.build(blacklist_params)
    @blacklist.save!
    redirect_to request.referrer
  end

def block_user(user)
  blacklist = Blacklist.new(blocked: user, owner_type: "Message")
  blacklist.save!
end
  private

  def blacklist_params
    params.require(:blacklist).permit(:blocked)
  end
end
