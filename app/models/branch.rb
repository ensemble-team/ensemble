class Branch < ApplicationRecord
  belongs_to :project
  has_many :comments, as: :comment_owner
  has_many :tracks, as: :track_owner
  has_many :requests, as: :request_owner
  has_many :messages, as: :source
  validates :title, presence: true
end
