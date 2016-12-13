class Collaboration < ApplicationRecord
  belongs_to :project
  has_many :notifications, as: :notification_owner


end
