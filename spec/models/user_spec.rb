require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  subject do
    user = User.new(name: 'Tom', photo: 'image.png', bio: 'I am programmer', posts_counter: 0)
    Post.new(title: 'Hello world', text: 'Helloworld',
             likes_counter: 0, comments_counter: 0, user:)
  end

  before { subject.save }

  it 'should check validation' do
    expect(subject).to be_valid
  end
end
