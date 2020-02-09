class Condition < ApplicationRecord
  belongs_to :user
  validates :condition_date, presence: true
  validates :meal, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :defecation, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :sleep, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :alcohol, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :exercise, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :stress, presence: true,numericality:  { only_integer: true, less_than: 6 }

end
