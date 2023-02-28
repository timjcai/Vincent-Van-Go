class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.boolean :available
      t.date :date
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
