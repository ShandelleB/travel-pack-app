class RemoveAttributesFromSuggestions < ActiveRecord::Migration
  def change
    remove_column :avatar_file_name,:avatar_content_type,:avatar_file_size,:avatar_updated_at,:category
  end
end
