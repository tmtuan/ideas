class AddTagToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :tag, foreign_key: true
  end
end
