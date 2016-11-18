class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :post

  validates :reply, presence: true
end
