class ToppagesController < ApplicationController
  def index
    if logged_in?
      @wish = current_user.wishes.build  # form_with 用
      @wishes = current_user.wishes.order(id: :desc).page(params[:page])
      @stock = current_user.stocks.build  # form_with 用
      @stocks = current_user.stocks.order(id: :desc).page(params[:page])
      @nonda = current_user.nondas.build  # form_with 用
      @nondas = current_user.nondas.order(id: :desc).page(params[:page])

    end  
  end
end
