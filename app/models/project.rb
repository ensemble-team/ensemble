class Project < ApplicationRecord
  has_many :tracks, as: :track_owner
  has_many :comments, as: :comment_owner
  validates :title, presence: true
end
