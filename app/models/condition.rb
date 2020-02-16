class Condition < ApplicationRecord
  belongs_to :user
  #current_userを使うためにSessionHelperをinclude
  # include ActionView::Helpers::SessionsHelper
  
  validates :condition_date, presence: true
  validates :meal, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :defecation, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :sleep, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :alcohol, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :exercise, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :stress, presence: true,numericality:  { only_integer: true, less_than: 6 }
  
  #ログインしているユーザーのconditionを取得する。
  scope :active, -> (user_id) { where(user_id: user_id) }
  
  #テーブルをcondition_dateの降順で表示
  scope :sorted, -> { order(condition_date: :desc) }
  
    # def self.search(search)
    #   if search
    #     Condition.where(['content LIKE ?', "%#{search}%"])
    #   else
    #     Condition.all
    #   end
    # end

end
