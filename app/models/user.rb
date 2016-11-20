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

  # All the users thats are requesting to be friends with current user
  has_many :friend_requests, -> { where(accepted: false) }, class_name: 'Friendship', foreign_key: :friend_id
  has_many :requesters, through: :friend_requests, source: :user

  # All the users current user has sent requests to be friends with
  has_many :requested_friends, -> { where(accepted: false) }, class_name: 'Friendship', foreign_key: :user_id
  has_many :requestees, through: :requested_friends, source: :friend

  # Established friendships through acceptence
  has_many :friendships, -> { where(accepted: true) }
  has_many :friends, through: :friendships

  # has_many :inverse_friendships, -> { where(accepted: true) }, class_name: 'Friendship', foreign_key: :friend_id
  # has_many :inverse_friends, through: :inverse_friendships, source: :user

  def make_profile
    create_profile unless profile
  end

  def send_friend_request(other_user)
    requested_friends.create(friend_id: other_user)
  end

  def cancel_friend_request(other_user)
    requested_friends.find_by(friend_id: other_user).destroy
  end

  def friends?(other_user)
    friends.include?(other_user)
  end

  def already_requested?(other_user)
    requestees.include?(other_user)
  end

  def request_from?(other_user)
    requesters.include?(other_user)
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
