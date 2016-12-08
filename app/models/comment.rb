class Comment < ApplicationRecord
  belongs_to :user
   belongs_to :comment_owner, polymorphic: true
end
