class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :sorted, -> { order(created_at: :desc) }
end
