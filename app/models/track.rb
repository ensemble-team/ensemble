class Track < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :track_owner, polymorphic: true
end
