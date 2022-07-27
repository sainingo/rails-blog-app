require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.new(name: 'Tom', photo: 'image.png', bio: 'I am programmer', posts_counter: 0)
    Post.new(title: 'Hello world', text: 'Helloworld',
             likes_counter: 0, comments_counter: 0, user:)
  end

  user = User.new(name: 'Tom', photo: 'image.png', bio: 'I am programer', posts_counter: 0)

  before { user.save }

  it 'should return most recent comments' do
    user.likes.create!(post: subject)
    user.likes.create!(post: subject)
    user.likes.create!(post: subject)

    expect(subject.likes_counter).to eql 3
  end
end
