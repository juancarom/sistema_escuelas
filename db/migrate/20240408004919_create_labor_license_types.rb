# frozen_string_literal: true

class CreateLaborLicenseTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :labor_license_types do |t|
      t.string :name
      t.string :abreviation
      t.boolean :with_salary
      t.boolean :continuous_days
      t.integer :limit
      t.integer :year_limit
      t.integer :month_limit
      t.text :description

      t.timestamps
    end
  end
end
