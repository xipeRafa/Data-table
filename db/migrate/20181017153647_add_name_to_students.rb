class AddNameToStudents < ActiveRecord::Migration[5.2]
  def change
  	add_column :students, :name, :string
  	add_index :students, :name

  	##save name for all existing students
  	Student.all.collect(&:save)
  end
end
