class Student < ApplicationRecord

  include PgSearch
  pg_search_scope :search,
                 :against => :name,
                  :using => {
                    :trigram => {
                      :threshold => 0.1
                    }
                  }

  belongs_to :classroom
  has_one :grade, through: :classroom
  has_one :grade_id, through: :grade
  has_one :school, through: :classroom
  has_many :studentdatum
  validates :first_name, :last_name, :middlename, :isactive, :classroom_id, presence: true

  before_save :save_student_name


  def full_name
    "#{first_name} #{middlename} #{last_name}"
  end

  def status
    isactive ? "Active" : "Inactive"
  end

  private
     
     ##this is used for PG Search
     def save_student_name
          self.name = full_name
     end
end