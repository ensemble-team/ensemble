module BlacklistsHelper

  def find_collab(blacklist)
    block = blacklist.blocked
    collab = Collaboration.find_by({collaborator: block })
    collab.destroy
  end
end
