class Place < ApplicationRecord
  validates :name, :country, presence: true
end
