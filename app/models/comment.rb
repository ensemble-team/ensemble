class Comment < ApplicationRecord
  belongs_to :track 
  belongs_to :user
  belongs_to :project
end
