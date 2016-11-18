class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_save :make_profile

  validates :first_name, :last_name, presence: true

  has_many :posts, dependent: :destroy, inverse_of: :user
  has_many :comments, dependent: :destroy, inverse_of: :user
  has_one :profile, dependent: :destroy

  def make_profile
    create_profile unless profile
  end

  def full_name
    first_name + ' ' + last_name
  end
end
