require 'rails_helper' # Return character is CR+LF on Windows.

RSpec.describe Post, type: :model do
  describe 'Validations' do
    user1 = User.create(Name: 'Nati', Bio: 'Hello! My name is King Nati.', PostCounter: 0)
    subject do
      Post.new(Title: 'My post', Text: 'Hello! My name is King Nati.', author_id: user1, CommentsCounter: 2, LikesCounter: 2)
    end

    before { subject.save }

    it 'Title should be present' do
      subject.Title = nil
      expect(subject).to_not be_valid
    end

    it 'Comments counter should be greater than or equal to 0' do
      subject.CommentsCounter = -1
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be greater than or equal to 0' do
      subject.LikesCounter = -1
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be integer' do
      subject.LikesCounter = 2.2
      expect(subject).to_not be_valid
    end

    describe 'Should test methods in post model' do
      it 'Post should have five recent comments' do
        expect(subject.recent_comments).to eq(subject.comments.last(5))
      end
    end
  end
end
