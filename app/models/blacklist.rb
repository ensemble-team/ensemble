class Blacklist < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
