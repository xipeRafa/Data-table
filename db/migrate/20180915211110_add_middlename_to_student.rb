class AddMiddlenameToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :middlename, :string
  end
end
