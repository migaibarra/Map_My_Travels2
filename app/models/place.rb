class Place < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, :country, presence: true
end
