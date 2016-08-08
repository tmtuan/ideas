class CreateIdeaTags < ActiveRecord::Migration
  def change
    create_table :idea_tags do |t|
      t.integer :ideaId
      t.integer :tagId

      t.timestamps null: false
    end
  end
end
