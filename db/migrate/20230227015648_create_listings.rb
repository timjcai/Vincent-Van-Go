class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :capacity
      t.boolean :pet_friendly
      t.boolean :luxury
      t.boolean :wifi
      t.boolean :bbq
      t.boolean :kitchen
      t.boolean :bathroom
      t.boolean :shower
      t.boolean :tv
      t.boolean :airconditioning
      t.boolean :heating
      t.timestamps
    end
  end
end
