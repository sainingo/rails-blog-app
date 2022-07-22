class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_post_counter

  def return_five_comments
    comment.order('created_at Desc').limit(3)
  end

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
