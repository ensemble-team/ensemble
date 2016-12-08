class Project < ApplicationRecord
  has_many :tracks
  has_many :comments, as: :comment_owner
  validates :title, presence: true
end
