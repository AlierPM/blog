class Comment < ApplicationRecord
  belongs_to :post, class_name: :Post, foreign_key: :post_id
  belongs_to :author, class_name: :User, foreign_key: :author_id
  validates :text, presence: true, length: { minimum: 3 }
  validates :author_id, presence: true
  validates :post_id, presence: true

  def update_comment_counter
    post.comments_counter += 1
    post.save
  end
end
