class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def retrieve_recent_posts
    posts.order(:created_at).limit(3)
  end
end
