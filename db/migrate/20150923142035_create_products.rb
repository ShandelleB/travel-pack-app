class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.string :brand
      t.string :category

      t.timestamps null: false
    end
  end
end
