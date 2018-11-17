class AddTermToClassroom < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :term, :integer
  end
end
