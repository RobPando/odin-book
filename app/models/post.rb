class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user, dependent: :destroy
  has_many :comments
end
