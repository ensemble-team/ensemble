class Request < ApplicationRecord
  belongs_to :request_owner, polymorphic: true
  validates :message, presence: true

end
