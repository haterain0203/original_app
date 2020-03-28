class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  scope :sorted, -> { order(created_at: :desc) }
end
