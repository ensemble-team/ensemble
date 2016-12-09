class Request < ApplicationRecord
  validates :message, presence: true
end
