class Branch < ApplicationRecord
  belongs_to :project
  has_many :comments, as: :owner, dependent: :destroy
  has_many :notifications, as: :owner, dependent: :destroy
  has_many :tracks, as: :owner, dependent: :destroy
  has_many :requests, as: :owner, dependent: :destroy
  has_many :messages
  has_many :blacklists, as: :owner
  validates :title, presence: true
end
