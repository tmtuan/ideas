class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :content
      t.string :description

      t.timestamps null: false
    end
  end
end
