class Track < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :project
  has_many :comments, as: :comment_owner
  validates :title, presence: true
end
