class Project < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
end
