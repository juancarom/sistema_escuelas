class CreateConfigurations < ActiveRecord::Migration[7.1]
  def change
    create_table :configurations do |t|
      t.integer :number
      t.string :name
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :state
      t.string :country
      t.boolean :singleton_guard

      t.timestamps
    end
    add_index :configurations, :singleton_guard, unique: true
  end
end
