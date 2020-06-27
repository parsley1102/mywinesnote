class NondasController < ApplicationController
  before_action :set_nonda, only: [:show, :edit, :update, :destroy]

  # GET /nondas
  # GET /nondas.json
  def index
    @nondas = Nonda.all
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
    @nonda = Nonda.new(nonda_params)

    respond_to do |format|
      if @nonda.save
        format.html { redirect_to @nonda, notice: 'Nonda was successfully created.' }
        format.json { render :show, status: :created, location: @nonda }
      else
        format.html { render :new }
        format.json { render json: @nonda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nondas/1
  # PATCH/PUT /nondas/1.json
  def update
    respond_to do |format|
      if @nonda.update(nonda_params)
        format.html { redirect_to @nonda, notice: 'Nonda was successfully updated.' }
        format.json { render :show, status: :ok, location: @nonda }
      else
        format.html { render :edit }
        format.json { render json: @nonda.errors, status: :unprocessable_entity }
      end
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
end
