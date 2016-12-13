class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  has_many :notifications, as: :owner, dependent: :destroy
end
