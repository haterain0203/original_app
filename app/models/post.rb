class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  
  scope :sorted, -> { order(created_at: :desc) }
end
