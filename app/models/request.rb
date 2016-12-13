class Request < ApplicationRecord
  belongs_to :owner, polymorphic: true
  validates :message, presence: true
  has_many :notifications, as: :owner

end
