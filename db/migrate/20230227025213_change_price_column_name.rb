class ChangePriceColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :listings, :price, :price_per_day
  end
end
