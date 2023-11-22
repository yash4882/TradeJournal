class TradesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trade, only: %i[ show edit update destroy ]
  after_action :calculation, only: [:create, :update]

  def index
    # @trades = Trade.all
    @trades = current_user.trades

  end

  def show
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
  end

  def update

    if @trade.update(trade_params)
      redirect_to @trade
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trade.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def trade_params
      params.require(:trade).permit(:date, :scrip, :position, :conviction, :trade_reason, :quantity, :entry_price, :stoploss, :risk, :stoploss, :target, :reward, :riskreward, :exit_price, :profit_loss, :rr_achieved, :learning, :mistakes, :user_id)
    end

    def set_trade
      @trade = Trade.find(params[:id])
    end

    def calculation
      risk = (@trade.stoploss.to_f - @trade.entry_price.to_f) * @trade.quantity.to_i

      reward = (@trade.target.to_f - @trade.entry_price.to_f) * @trade.quantity.to_i
  
      riskreward = (reward / risk.abs)

      pnl =  (@trade.exit_price.to_f - @trade.entry_price.to_f) * @trade.quantity.to_i

      rr_achieved = (risk.abs + reward) / pnl.to_i

      @trade.update(risk:risk, reward:reward, riskreward:riskreward, profit_loss:pnl ,rr_achieved:rr_achieved)
    end
end
