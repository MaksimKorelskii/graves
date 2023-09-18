# frozen_string_literal: true

class CreateGraves < ActiveRecord::Migration[7.0]
  def change
    create_table :graves do |t|
      t.string :last_name
      t.string :first_name
      t.string :father_name
      t.date :birthday
      t.date :deathday
      t.belongs_to :cemetery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
