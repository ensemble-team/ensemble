class Collaboration < ApplicationRecord
  belongs_to :project
  has_many :notifications, as: :owner


end
