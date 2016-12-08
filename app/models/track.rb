class Track < ApplicationRecord
  belongs_to :users
  belongs_to :track_owner, polymorphic: true
end
