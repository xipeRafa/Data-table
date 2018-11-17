class AddGradeToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :grade, foreign_key: true
  end
end
