class Schooldistrict < ApplicationRecord
  validates :name, :state, :city, :zip, presence: true
end
