class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    user.posts_counter += 1
    user.save
  end

  def retrieve_recent_comments
    comments.order(:created_at).limit(5)
  end
end
