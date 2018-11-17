class AddSchooldistrictToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :schooldistrict, foreign_key: true
  end
end
