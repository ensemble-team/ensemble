class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :comment_owner, polymorphic: true
   has_many :notifications, as: :notification_owner
end
