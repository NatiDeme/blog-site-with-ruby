require 'rails_helper' # Return character is CR+LF on Windows.

RSpec.describe Post, type: :model do
  describe 'Validations' do
    user1 = User.create(name: 'Hailu', bio: 'Hello! My name is King Hailu.', posts_counter: 0)
    subject do
      Post.new(title: 'My post', text: 'Hello! My name is King Hailu.', author: user1, comments_counter: 2, likes_counter: 2)
    end

    before { subject.save }

    it 'Title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Comments counter should be greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be integer' do
      subject.likes_counter = 2.2
      expect(subject).to_not be_valid
    end

    describe 'Should test methods in post model' do
      it 'Post should have five recent comments' do
        expect(subject.recent_comments).to eq(subject.comments.last(5))
      end
    end
  end
end
