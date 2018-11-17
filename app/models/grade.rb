class Grade < ApplicationRecord
  belongs_to :school
  has_many :classrooms
  has_many :users, through: :classrooms
  has_many :students, through: :classrooms
  validates :name, :school_id, presence: true
end
