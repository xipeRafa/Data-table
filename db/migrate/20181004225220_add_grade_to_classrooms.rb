class AddGradeToClassrooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :classrooms, :grade, foreign_key: true
  end
end
