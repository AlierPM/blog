class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  validates :author_id, presence: true
  validates :post_id, presence: true
  validates :author_id, uniqueness: { scope: :post_id }

  after_save :update_like_counter

  private

  def update_like_counter
    post.increment!(:likes_counter)
  end
end
