class Studentdatum < ApplicationRecord
  belongs_to :student
  belongs_to :classroom
  has_one :user, :through => :classroom
  validates :title, :text, :student_id, :user_id, :classroom_id, presence: true
end
