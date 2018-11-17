class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
    	   t.string :name
    	   t.string :frequency
    	   t.string :symbol
    	   t.integer :amount
    	   t.string :currency
    	   t.text :features
    	   t.timestamps
    end

    add_index :plans, :name
  end
end