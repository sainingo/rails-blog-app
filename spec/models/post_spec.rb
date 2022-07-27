require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.new(name: 'Tom', photo: 'image.png', bio: 'I am programmer', posts_counter: 0)
    Post.new(title: 'Hello world', text: 'Helloworld',
             likes_counter: 0, comments_counter: 0, user:)
  end

  before { subject.save }

  it 'should check validation' do
    expect(subject).to be_valid
  end

  it 'should have 250 characters' do
    subject.title = 'f' * 300
    expect(subject).to_not be_valid
  end

  it 'should be invalid if comment counter is nil' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should be invalid if like counter is nil' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should update user post  counter' do
    expect(subject.user.posts_counter).to eql 1
  end
end
