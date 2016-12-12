class Blacklist < ApplicationRecord
  belongs_to :block_source, polymorphic: true
end
