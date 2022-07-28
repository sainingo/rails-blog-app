class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :comments

  def return_three_posts
    posts.order('created_at Desc').limit(3)
  end

  def admin?
    role == 'admin'
  end
end
