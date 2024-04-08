# frozen_string_literal: true

class CreateLaborLicenses < ActiveRecord::Migration[7.1]
  def change
    create_table :labor_licenses do |t|
      t.references :person, null: false, foreign_key: true
      t.references :labor_license_type, null: false, foreign_key: true
      t.date :date_from
      t.date :date_to
      t.text :description

      t.timestamps
    end
  end
end
