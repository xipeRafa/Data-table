class RemoveGradeFromClassrooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :classrooms, :grade, :string
  end
end
