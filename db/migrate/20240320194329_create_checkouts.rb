class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.string :checkout_type, null: false, limit: 36
      t.text :checkout_desc, null: false
      t.string :checkout_destination, null: false, limit: 75
      t.string :checkout_origin, null: false, limit: 75

      # Props
      t.string :created_by, null: false, limit: 36
      t.timestamps
    end
  end
end
