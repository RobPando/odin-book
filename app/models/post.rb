class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user, inverse_of: :posts
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
end
