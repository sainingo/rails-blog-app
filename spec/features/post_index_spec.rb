require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before(:each) do
      @user1 = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/ESfEr8WpTjs', bio: 'bio', posts_counter: 0)
      @user1.save!
      visit root_path

      @post1 = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      @comment1 = Comment.create(text: 'Comment 1!',
                                 post: Post.first)
    end

    it "shows user's profile picture" do
      visit(user_posts_path(@user1.id))
      expect(page).to have_css('img[src*="https://unsplash.com/photos/ESfEr8WpTjs"]')
    end

    it 'shows the users username' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('Tom')
    end

    it 'shows number of posts of user has written' do
      visit(user_posts_path(@user1.id))
      post = Post.all
      expect(post.size).to eql(0)
    end

    it 'shows number of posts by user' do
      visit(user_posts_path(@user1.id))
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it 'shows posts title' do
      visit(user_posts_path(@user1.id))
      user = User.first
      expect(page).to have_content(user.name)
    end

    it 'can see some of the post detail' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('Tom')
    end

    it "redirects the user to the post's show page after clickin on it" do
      visit(user_posts_path(@user1.id))
      user = User.first
      expect(page).to have_content(user.name)
    end
  end
end
