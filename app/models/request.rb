class Request < ApplicationRecord
  belongs_to :request_owner, polymorphic: true
  validates :message, presence: true


    def approve_request
      self.update({ status: "Approved"})
      # @collaboration = Collaboration.new
      # @collaboration.update({ collaborator: self.collab_id})

    end

    def reject_request
      self.update({ status: "Rejected"})
    end
end
