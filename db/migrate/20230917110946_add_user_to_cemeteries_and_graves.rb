class AddUserToCemeteriesAndGraves < ActiveRecord::Migration[7.0]
  def change
    change_table :cemeteries do |t|
      t.references :user, null: false, foreign_key: {to_table: :users}
    end

    change_table :graves do |t|
      t.references :user, null: false, foreign_key: {to_table: :users}
    end
  end
end
