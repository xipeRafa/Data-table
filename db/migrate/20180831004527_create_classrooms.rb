class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :subject
      t.string :grade
      t.belongs_to :school, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
