class Track < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :project
end
