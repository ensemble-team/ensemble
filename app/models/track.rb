class Track < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :track_owner, polymorphic: true
  validates_presence_of :title
end
