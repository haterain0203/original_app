class Contact < ApplicationRecord
    validates :name, presence: true, length: {maximum:15}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX }
    validates :message, presence: true

    scope :sorted, -> { order(created_at: :desc) }
end
