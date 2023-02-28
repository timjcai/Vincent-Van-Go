class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.float :price
      t.boolean :pet_friendly
      t.boolean :luxury
      t.integer :capacity
      t.string :vehicle_type
      t.timestamps
    end
  end
end
