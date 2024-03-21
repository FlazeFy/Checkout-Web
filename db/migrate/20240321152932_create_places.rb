class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :place_category, null: false, limit: 36
      t.text :place_name, null: false, limit: 75

      # Props
      t.string :created_by, null: false, limit: 36
      t.timestamps
    end
  end
end
