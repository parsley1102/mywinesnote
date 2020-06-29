class NondasController < ApplicationController
  before_action :set_nonda, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :edit, :update, :show]

  # GET /nondas
  # GET /nondas.json
  def index
    @nondas = current_user.nondas.order(id: :desc).page(params[:page])
  end

  # GET /nondas/1
  # GET /nondas/1.json
  def show
  end

  # GET /nondas/new
  def new
    @nonda = Nonda.new
  end

  # wishから作成する場合
  def new_from_wish
    wish = Wish.find(params[:id]) # wish作成
    # wishのうちnondaとの共通部分をnondaオブジェクトに入れてnondaオブジェクトを生成
    @nonda = Nonda.new(wish.slice(:wine_name, :producer, :country, :region, :general_notes))
    render action: :new # newのビューへ遷移
  end

  # stockから作成する場合
  def new_from_stock
    stock = Stock.find(params[:id]) # stock作成
    # stockのうちnondaとの共通部分をnondaオブジェクトに入れてnondaオブジェクトを生成
    @nonda = Nonda.new(stock.slice(:wine_name, :producer, :country, :region, :general_notes))
    render action: :new # newのビューへ遷移
  end

  # GET /nondas/1/edit
  def edit
  end

  # POST /nondas
  # POST /nondas.json
  def create
    @nonda = current_user.nondas.new(nonda_params)
      if @nonda.save
      flash[:success] = 'Nonda was successfully created'
      redirect_to @nonda
      else
        flash.now[:danger] = 'Nonda was not created'
        render :new
      end
  end

  # PATCH/PUT /nondas/1
  # PATCH/PUT /nondas/1.json
  def update

    if @nonda.update(nonda_params)
    flash[:success] = 'Nonda was successfully updated'
    redirect_to @nonda
    else
      flash.now[:danger] = 'Nonda was not updated'
      render :edit
    end
  end

  # DELETE /nondas/1
  # DELETE /nondas/1.json
  def destroy
    @nonda.destroy
    respond_to do |format|
      format.html { redirect_to nondas_url, notice: 'Nonda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nonda
      @nonda = Nonda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nonda_params
      params.require(:nonda).permit(:wine_name, :producer, :country, :region, :general_notes, :vintage, :price, :tasted_on, :tasted_pts, :tasting_notes)
    end
    
    def correct_user
      @nonda = current_user.nondas.find_by(id: params[:id])
      unless @nonda
      redirect_to root_url
      end
    end
end
