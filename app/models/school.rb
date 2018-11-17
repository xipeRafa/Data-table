class School < ApplicationRecord
  belongs_to :schooldistrict
  has_many :users
  has_many :grades
  has_many :classrooms
  has_many :students, :through => :classrooms
  validates :name, :schooldistrict_id, presence: true
  
end
