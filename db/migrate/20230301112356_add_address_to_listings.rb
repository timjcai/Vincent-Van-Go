class AddAddressToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :address, :string
  end
end
