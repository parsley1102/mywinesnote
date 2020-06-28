class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy, :nonda]
  before_action :correct_user, only: [:destroy]
  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end
  
  # wishから作成する場合
  def new_from_wish
    wish = Wish.find(params[:id]) # wish作成
    # wishのうちstockとの共通部分をstockオブジェクトに入れてstockオブジェクトを生成
    @stock = Stock.new(wish.slice(:wine_name, :producer, :country, :region, :general_notes))
    render action: :new # newのビューへ遷移
  end

  # GET /stocks/1/edit
  def edit
  end

  # Nondaボタン押下時
  def nonda
  #  @wish.del_flg = 1 # デリートフラグを１にして論理削除
  #  @wish.save! # 論削したことを保存
    redirect_to  nonda_from_stock_path(@stock) # nondas_controllerの new_from_stockアクションに遷移
  end
  
  # POST /stocks
  # POST /stocks.json
  def create
    @stock = current_user.stocks.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:wine_name, :producer, :country, :region, :general_notes, :vintage, :price, :amount, :bought_from, :bought_on, :cellar_id, :stock_notes, :status)
    end
    
    def correct_user
      @stock = current_user.stocks.find_by(id: params[:id])
      unless @stock
      redirect_to root_url
      end
    end
end
