class Like < ApplicationRecord
  # belongs_to :user
  # belongs_to :post
  belongs_to :author, class_name: 'User'
  belongs_to :post
end
