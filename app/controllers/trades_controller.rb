class TradesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @trades = Trade.all
  end

  def show
    @trade = Trade.find(params[:id])
  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)

    if @trade.save
      redirect_to @trade
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def update
    @trade = Trade.find(params[:id])

    if @trade.update(trade_params)
      redirect_to @trade
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def trade_params
      params.require(:trade).permit(:date, :scrip, :position, :conviction, :trade_reason, :quantity, :entry_price, :stoploss, :risk, :stoploss, :target, :reward, :riskreward, :exit_price, :profit_loss, :rr_achieved, :learning, :mistakes)
    end

end
