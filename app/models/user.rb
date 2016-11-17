class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_save :make_profile

  validates :first_name, :last_name, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, inverse_of: :user, dependent: :destroy

  def make_profile
    create_profile
  end

  def full_name
    first_name + ' ' + last_name
  end
end
