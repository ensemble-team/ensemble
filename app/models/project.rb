class Project < ApplicationRecord

  has_many :tracks, as: :owner, dependent: :destroy
  has_many :notifications, as: :owner
  has_many :comments, as: :owner, dependent: :destroy
  has_many :requests, as: :owner
  has_many :branches
  has_many :messages
  has_many :collaborations
  has_many :blacklists, as: :owner

  validates :title, presence: true
end
