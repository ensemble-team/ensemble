class Request < ApplicationRecord
  belongs_to :request_owner, polymorphic: true
  validates :message, presence: true
  has_many :notifications, as: :notification_owner

end
