class Notification < ApplicationRecord
  belongs_to :user
  # belongs_to :notification_owner, polymorphic: true
end
