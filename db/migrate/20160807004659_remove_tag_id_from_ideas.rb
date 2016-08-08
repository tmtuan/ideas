class RemoveTagIdFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :tag_id
  end
end
