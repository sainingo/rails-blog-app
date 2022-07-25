class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def return_three_posts
    posts.order('created_at Desc').limit(3)
  end
end
