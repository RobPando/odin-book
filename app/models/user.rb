class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :format_first_name, :format_last_name
  after_save :make_profile

  validates :first_name, :last_name, presence: true

  has_many :posts, dependent: :destroy, inverse_of: :user
  has_many :comments, dependent: :destroy, inverse_of: :user
  has_one :profile, dependent: :destroy

  # has_many :friend_requests, -> { where(accepted: false) }, class_name: 'Friendship'
  has_many :requested_friends, -> { where(accepted: false) }, class_name: 'Friendship',
                                                              foreign_key: :user_id

  has_many :friendships, -> { where(accepted: true) }
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :friend_id
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def make_profile
    create_profile unless profile
  end

  def send_friend_request(other_user)
    requested_friends.create(friend_id: other_user)
  end

  def cancel_friend_request(other_user)
    requested_friends.find_by(friend_id: other_user).destroy
  end

  def full_name
    first_name + ' ' + last_name
  end

  def format_first_name
    self.first_name = first_name.downcase.capitalize
  end

  def format_last_name
    self.last_name = last_name.downcase.capitalize
  end
end
