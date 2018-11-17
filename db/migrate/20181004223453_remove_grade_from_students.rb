class RemoveGradeFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :grade, :string
  end
end
