# frozen_string_literal: true

class CreateCemeteries < ActiveRecord::Migration[7.0]
  def change
    create_table :cemeteries do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
