class User < ApplicationRecord
  enum role: [:teacher, :admin, :superadmin]
  after_initialize :check_role, :if => :new_record?
  validates :role, :schooldistrict_id, :school_id, presence: true
  belongs_to :school, optional: true

  def check_role
    if self.role == 'superadmin'
      # add a better handler
      self.role ||= :teacher
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
