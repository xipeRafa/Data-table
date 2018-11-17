class Classroom < ApplicationRecord
  enum term: [:spring, :summer, :fall, :winter]
  belongs_to :school
  belongs_to :grade
  belongs_to :user
  has_many :students
  has_many :studentdatum, :through => :students
  validates :subject, :grade_id, :term, :school_id, :user_id, presence: true
  before_save :default_values

  def default_values
    self.archived ||= false # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
end
