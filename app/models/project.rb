class Project < ApplicationRecord
  has_many :tracks
  validates :title, presence: true
end
