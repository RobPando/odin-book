require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    before :each do
      @post = create(:post, user_id: 1)
    end
    it "creates post" do
      expect(@post).to be_valid
    end

    it "belongs to user" do
      expect(@post.user.first_name).to eq('Rick')
    end

    it "content can't be blank " do
      @post.content = ' '
      @post.valid?
      expect(@post.errors[:content]).to include("can't be blank")
    end
  end
end
