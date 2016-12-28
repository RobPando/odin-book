# Hebrews 1:11
class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true
end
