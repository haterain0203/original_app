class Condition < ApplicationRecord
  belongs_to :user
  #current_userを使うためにSessionHelperをinclude
  # include ActionView::Helpers::SessionsHelper
  
  validates :condition_date, presence: true, :uniqueness => {:scope => :user_id}
  validate :condition_date_cannot_be_in_the_future
  validates :skin_condition, presence: true
  validates :meal, presence: true
  validates :defecation, presence: true
  validates :sleep, presence: true
  validates :alcohol, presence: true
  validates :exercise, presence: true
  validates :stress, presence: true
  validates :text, length: { maximum: 30 }

  # numericality:  { only_integer: true, less_than: 6 }

  #ログインしているユーザーのconditionを取得する。
  scope :active, -> (user_id) { where(user_id: user_id) }
 
  #閲覧日-10から閲覧日までのみのconditionを取得する。
  #しかし、閲覧日が10日以前の場合エラーになる  
  # today = Date.today
  # to = Date.new(today.year,today.mon,today.day)
  # from = Date.new(today.year,today.mon,today.day-10)
  # scope :this_month, -> { where(condition_date: from..to ) }

  
  # scope :current_month, -> { where(condition_date: Time.now.beginning_of_month..Time.now.end_of_month) }
  # scope :last_month, -> { where(condition_date: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month) }
  
  # 直近１５日とその前の１５日とする場合
  now = Time.current
  scope :current_month, -> { where(condition_date: now.ago(15.days)..now) }
  scope :last_month, -> { where(condition_date: now.ago(30.days)..now.ago(15.days)) }

  #テーブルをcondition_dateの降順で表示
  scope :sorted, -> { order(condition_date: :desc) }
  
    # def self.search(search)
    #   if search
    #     Condition.where(['content LIKE ?', "%#{search}%"])
    #   else
    #     Condition.all
    #   end
    # end

  def condition_date_cannot_be_in_the_future
    if !condition_date.nil?
      if condition_date > Date.today
        errors.add(:condition_date, "は未来の日付では登録できません。")
      end
    end
  end

end
