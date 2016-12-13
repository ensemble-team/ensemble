class Track < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :owner, polymorphic: true
  validates_presence_of :title
  has_many :notifications, as: :owner
end
