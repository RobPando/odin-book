require 'rails_helper'

RSpec.describe Comment do
  it 'reply cannot be blank' do
    @post = create(:post, user_id: 1)
    @comment = build(:comment, user_id: 1, post_id: 1, reply: ' ')
    @comment.valid?
    expect(@comment.errors[:reply]).to include("can't be blank")
  end
end
