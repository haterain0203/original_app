class Condition < ApplicationRecord
  belongs_to :user
  #current_userを使うためにSessionHelperをinclude
  # include ActionView::Helpers::SessionsHelper
  
  validates :condition_date, presence: true, :uniqueness => {:scope => :user_id}
  validates :meal, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :defecation, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :sleep, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :alcohol, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :exercise, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :stress, presence: true,numericality:  { only_integer: true, less_than: 6 }
  validates :text, length: { maximum: 30 }

  #ログインしているユーザーのconditionを取得する。
  scope :active, -> (user_id) { where(user_id: user_id) }
 
  #閲覧日-10から閲覧日までのみのconditionを取得する。
  #しかし、閲覧日が10日以前の場合エラーになる
  
  today = Date.today
  to = Date.new(today.year,today.mon,today.day)
  from = Date.new(today.year,today.mon,today.day-10)
  scope :this_month, -> { where(condition_date: from..to ) }
  

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
