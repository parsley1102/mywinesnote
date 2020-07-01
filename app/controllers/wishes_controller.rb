class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy, :stock, :nonda]
  before_action :correct_user, only: [:destroy, :edit, :update, :show]
  
  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = current_user.wishes.order(id: :desc).page(params[:page])
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
    @wish = current_user.wishes.new(wish_params)
      if @wish.save
      flash[:success] = 'Wish was successfully created'
      redirect_to @wish
      else
        flash.now[:danger] = 'Wish was not created'
        render :new
      end
  end
  # PATCH/PUT /wishes/1
  # PATCH/PUT /wishes/1.json
  def update

    if @wish.update(wish_params)
    flash[:success] = 'Wish was successfully updated'
    redirect_to @wish
    else
      flash.now[:danger] = 'Wish was not updated'
      render :edit
    end
  end
  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish.destroy
    flash[:success] = 'Wish was successfully deleted'
      redirect_to @wish
  end
  
  # Stockボタン押下時
  def stock
    redirect_to  stock_from_wish_path(@wish) # stocks_controllerの new_from_wishアクションに遷移
  end
  
  # Nondaボタン押下時
  def nonda
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
    
    def correct_user
      @wish = current_user.wishes.find_by(id: params[:id])
      unless @wish
      redirect_to root_url
      end
    end

end
