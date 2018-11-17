class CreateStudentdata < ActiveRecord::Migration[5.2]
  def change
    create_table :studentdata do |t|
      t.string :title
      t.string :text
      t.references :student, foreign_key: true
      t.references :user, foreign_key: true
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
