class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :owner, polymorphic: true
   has_many :notifications, as: :owner, dependent: :destroy
end
