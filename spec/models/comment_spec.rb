require 'rails_helper'

RSpec.describe Comment do

  context "Creating a comment" do
    before :each do
      @post = create(:post, user_id: 1)
      @comment = build(:comment, user_id: 1, post_id: 1)
    end
    it 'reply cannot be blank' do
      @post = create(:post, user_id: 1)
      @comment.reply = ' '
      @comment.valid?
      expect(@comment.errors[:reply]).to include("can't be blank")
    end

    it "comments on a post" do
      @comment.reply = 'my reply'
      @comment.save
      expect(@comment).to be_valid
   end
  end
end
