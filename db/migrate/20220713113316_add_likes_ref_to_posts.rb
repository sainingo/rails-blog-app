# frozen_string_literal: true

# rubocop:disable Style/Documentation

class AddLikesRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :likes, null: false, foreign_key: true
  end
end

# rubocop:enable Style/Documentation
