class AddIsactiveToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :isactive, :boolean
  end
end
