class Project < ApplicationRecord

  has_many :tracks, as: :track_owner, dependent: :destroy
  has_many :comments, as: :comment_owner
  has_many :requests, as: :request_owner
  has_many :branches
  has_many :messages, as: :source
  has_many :collaborations

  validates :title, presence: true
end
