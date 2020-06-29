class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_stocks = user.stocks.where(del_flg: nil).count
    @count_wishes = user.wishes.where(del_flg: nil).count
    @count_nondas = user.nondas.count
  end
end
