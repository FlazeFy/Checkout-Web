class CreateDictionaries < ActiveRecord::Migration[7.0]
  def change
    create_table :dictionaries do |t|
      t.string :dictionary_type, null: false, limit: 36
      t.text :dictionary_name, null: false, limit: 36

      t.timestamps
    end
  end
end
