class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_post_counter
  after_destroy :update_posts_counter_after_destroy

  def return_five_comments
    comment.order('created_at Desc').limit(3)
  end

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def update_posts_counter_after_destroy
    user.decrement!(:posts_counter)
  end
end
