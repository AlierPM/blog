class RemoveTextFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :text, :string
  end
end
