class Track < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :project
  validates :title, presence: true
end
