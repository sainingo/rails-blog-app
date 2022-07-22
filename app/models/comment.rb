class Comment < ApplicationRecord
  # belongs_to :author, class_name: 'User'
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter

  def recent_comments
    comments.order('created_at Des').limit(5)
  end

  private

  def update_comments_counter
    post.increment!(:comment_counter)
  end
end
