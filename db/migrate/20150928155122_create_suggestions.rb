class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :city
      t.string :state
      t.text :packing_list
      t.string :category
      t.datetime :created_at
      t.datetime :updated_at
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.string :slug

      t.timestamps null: false
    end
  end
end
