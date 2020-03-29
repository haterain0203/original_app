class StaticPagesController < ApplicationController
  def home
    @status = logged_in?
    @register = logged_in? ? "登録済み" : "新規登録"
    @login = logged_in? ? "ログイン済み" : "ログイン"
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def input
  end
  
end
