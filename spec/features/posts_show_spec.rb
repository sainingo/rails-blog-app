require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  describe 'Post' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/ESfEr8WpTjs',
                                bio: 'Teacher from Mexico.', posts_counter: 0)
      @first_user.save!
      @second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/ESfEr8WpTjs',
                                 bio: 'Teacher from Poland.', posts_counter: 0)
      @second_user.save!
      visit root_path

      @first_post = Post.create(title: 'Hello', text: 'This is my first post',
                                comments_counter: 0, likes_counter: 0)
      @second_post = Post.create(title: 'Hello, again', text: 'This is my second post',
                                 comments_counter: 0, likes_counter: 0)
      @third_post = Post.create(title: 'Hello', text: 'This is my first post',
                                comments_counter: 0, likes_counter: 0)
      @fourth_post = Post.create(title: 'Hello, again', text: 'This is my second post',
                                 comments_counter: 0, likes_counter: 0)

      @comment1 = Comment.create(post: Post.first, text: 'Hi Tom!')

      visit root_path
    end

    it 'shows posts title' do
      user = User.first
      expect(page).to have_content(user.name)
    end

    it 'shows the person who wrote the post' do
      user = User.first
      expect(page).to have_content(user.name)
    end

    it 'shows number of comments' do
      user = User.first
      expect(page).to have_content(user.name)
    end

    it 'shows number of likes' do
      user = User.first
      expect(page).to have_content(user.name)
    end

    it 'can see the post\'s body.' do
      user = User.first
      expect(page).to have_content(user.name)
    end

    it 'can see the username of each commentor.' do
      user = User.first
      expect(page).to have_content(user.name)
    end

    it 'can see the comments of each commentor.' do
      user = User.first
      expect(page).to have_content(user.name)
    end
  end
end
