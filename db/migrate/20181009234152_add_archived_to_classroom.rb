class AddArchivedToClassroom < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :archived, :bool
  end
end
