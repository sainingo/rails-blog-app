class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_post_counter
  after_destroy :update_posts_counter_after_destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def return_five_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def update_posts_counter_after_destroy
    user.decrement!(:posts_counter)
  end
end
