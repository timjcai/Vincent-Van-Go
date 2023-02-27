class AddUserIDtoListingsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :listings, :user, index: true
  end
end
