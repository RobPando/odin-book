require 'rails_helper'

RSpec.describe User, type: :model do
  context "model validations" do
    before :each do
      @user = build(:user)
    end

    it "first_name can't be blank" do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it "last_name can't be blank" do
      @user.last_name = ' '
      @user.valid?
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it "email can't be blank" do
      @user.email = ' '
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "password can't be blank" do
      @user.password = ' '
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "password can't be less than 6 chars" do
      @user.password = 'a' * 5
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user).to_not be_valid
    end
  end
  context 'successfully creates a user' do
    before :each do
      @user = build(:user, email: 'rob@example.com')
    end

    it 'creates a user' do
      @user.save
      expect(@user).to be_valid
    end

    it 'creates a profile' do
      expect(@user.profile).to_not be_nil
    end
  end
end
