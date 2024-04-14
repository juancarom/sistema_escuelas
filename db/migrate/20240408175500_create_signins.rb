# frozen_string_literal: true

class CreateSignins < ActiveRecord::Migration[7.1]
  def change
    create_table :signins do |t|
      t.references :person, null: false, foreign_key: true
      t.string :signin_type
      t.datetime :time

      t.timestamps
    end
  end
end
