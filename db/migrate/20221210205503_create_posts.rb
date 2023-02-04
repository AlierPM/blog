class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
