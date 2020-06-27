class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy, :createstockfromwish, :stock, :nonda]

  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = Wish.where(del_flg: 0).order(id: :desc)
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
  end

  # GET /wishes/new
  def new
    @wish = Wish.new
  end
  
  
  
  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes
  # POST /wishes.json
  def create
    @wish = Wish.new(wish_params)

    respond_to do |format|
      if @wish.save
        format.html { redirect_to @wish, notice: 'Wish was successfully created.' }
        format.json { render :show, status: :created, location: @wish }
      else
        format.html { render :new }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishes/1
  # PATCH/PUT /wishes/1.json
  def update
    respond_to do |format|
      if @wish.update(wish_params)
        format.html { redirect_to @wish, notice: 'Wish was successfully updated.' }
        format.json { render :show, status: :ok, location: @wish }
      else
        format.html { render :edit }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish.destroy
    respond_to do |format|
      format.html { redirect_to wishes_url, notice: 'Wish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # Stockボタン押下時
  def stock
    @wish.del_flg = 1 # デリートフラグを１にして論理削除
    @wish.save! # 論削したことを保存
    redirect_to  stock_from_wish_path(@wish) # stocks_controllerの new_from_wishアクションに遷移
  end
  
  # Nondaボタン押下時
  def nonda
    @wish.del_flg = 1 # デリートフラグを１にして論理削除
    @wish.save! # 論削したことを保存
    redirect_to  nonda_from_wish_path(@wish) # nondas_controllerの new_from_wishアクションに遷移
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      @wish = Wish.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wish_params
      params.require(:wish).permit(:wine_name, :producer, :country, :region, :general_notes, :min_price, :max_price, :wishes_note)
    end
    
#    def stockfromwish_params
#      params.require(:wish).permit(:wine_name, :producer, :country, :region, :general_notes)
#    end
    
end
