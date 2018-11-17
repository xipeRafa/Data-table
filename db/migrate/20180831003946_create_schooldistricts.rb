class CreateSchooldistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :schooldistricts do |t|
      t.string :name
      t.string :state
      t.string :city
      t.integer :zip

      t.timestamps
    end
  end
end
