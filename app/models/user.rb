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

  def make_profile
    create_profile unless profile
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
